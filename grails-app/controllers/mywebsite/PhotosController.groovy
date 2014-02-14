package mywebsite

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.json.JSONObject

class PhotosController {

    static def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']
    static String dir = "/images/photos/"
    static int maxResults = 9 //number of pics loaded per request


    def index() {

        def c = Photos.createCriteria()

        if (params.albumName) {

            def photos = c {
                eq("albumName", params.albumName)
                order("id", "desc")
                maxResults(maxResults)
            }


            def model = ['photos': photos]
            model.current = maxResults
            model.album = params.albumName
            render(view: "photos", model: model)
            return
        } else {
            def photos = c {

                order("id", "desc")
                maxResults(maxResults)
            }


            def model = ['photos': photos]
            model.current = maxResults
            render(view: "photos", model: model)
             return
        }


    }


    def singlePic() {
        def id = params.id
        def albumName = params.albumName

        def prev = params.prev ? params.prev : null
        def next = params.next ? params.next : null

        //if prev and next are both null, then it's the first request

        if (id) {
            if (!prev && !next) {
                def single = Photos.findById(id)
                single.likeAccount+=1;
                single.save();

                def model = ['pic': single]

                render(view: "single", model: model)
                return
            } else {
                def c = Photos.createCriteria()

                def firstId = Photos.findAllByAlbumName(albumName).first().id
                def lastId = Photos.findAllByAlbumName(albumName).last().id

                def photos

                if (id == firstId) {

                    def a = [] as JSONObject

                    a.error = 501
                    a.message = "It's already the first photo."

                    render(contentType: "application/json", text: a)
                } else if (id == lastId) {

                    def a = [] as JSONObject

                    a.error = 501
                    a.message = "It's already the last photo."

                    render(contentType: "application/json", text: a)


                } else {
                    if (prev) {
                        photos = c {
                            eq("albumName", albumName)
                            order("id", "asc")
                            le("id", id)
                            maxResults(1)
                        }

                        def a = [] as JSONObject
                        photos.getAt(0).likeAccount+=1;
                        photos.getAt(0).save();
                        a.error = 0
                        a.photo = photos
                        a.prev = photos.getAt(0).id != firstId
                        a.next = photos.getAt(0).id != lastId
                        render(contentType: "application/json", text: a)


                    }

                    if (next) {
                        photos = c {
                            eq("albumName", albumName)
                            order("id", "asc")
                            gt("id", id)
                            maxResults(1)
                        }

                        def a = [] as JSONObject
                        photos.getAt(0).likeAccount+=1;
                        photos.getAt(0).save();
                        a.error = 0
                        a.photo = photos
                        a.prev = photos.getAt(0).id != firstId
                        a.next = photos.getAt(0).id != lastId
                        render(contentType: "application/json", text: a)


                    }


                }

            }


        } else {
            flash.message = "Invalid request: the photo doesn't exist."

        }

    }



    def getMorePics() {
        def model = [:]
        int currentNumber = params.current
        def album = params.albumName
        def allPhotos
        if (album)
            allPhotos = Photos.findAllByAlbumName(album)
        else
            allPhotos = Photos.findAll()

        def photos

        int size = photos.size()
        if (size < currentNumber + maxResults - 1) {
            // if the album doesn't have so many photos, return the rest of it
            photos = allPhotos.subList(currentNumber, size - 1)


        } else {

            photos = allPhotos.subList(currentNumber, currentNumber + maxResults - 1)
        }

        photos.each {
            it.likeAccount+=1;
            it.save();
        }
        model.photos = photos
        model.current = currentNumber + 10
        render(view: "photos", model: model)


    }



    def upload() {
        def file = request.getFile('uploadFile')

//        def md5 = generateMD5(file)
        String albumName = params.albumName

        String baseImageName = java.util.UUID.randomUUID().toString();


        def fileType = file.getContentType()
        if (!okContentTypes.contains(fileType)) {
            flash.message = "Image type must be one of: ${okContentTypes}"
            render(view: "photos")
            return

        }

        switch (fileType) {
            case "image/jpeg":
                baseImageName += ".jpg"
                break
            case "image/png":
                baseImageName += ".png"
                break

            case "image/gif":
                baseImageName += ".gif"
                break

            case "image/bmp":
                baseImageName += ".bmp"
                break

        }



        String fileUploaded = uploadFile(file, baseImageName, dir)

        if (fileUploaded) {

            addOnePhoto(albumName, params.desc, dir + baseImageName)

//            file.transferTo(new File("${dir}${baseImageName}.jpg"))
        } else {
            // handle when uploading fails

        }


        redirect(action: "index")
        return

    }

    def uploadFile(def file, String imageName, String destinationDirectory) {
        def serveletContext = ServletContextHolder.servletContext
        def storagePath = serveletContext.getRealPath(destinationDirectory)
//       def storagePath = "http://localhost"+destinationDirectory
        def storagePathDirectory = new File(storagePath)

        if (!storagePathDirectory.exists()) {
            println("creating directory ${storagePath}")
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }

        // Store file

        if (!file.isEmpty()) {
            file.transferTo(new File("${storagePath}/${imageName}"))
            println("Saved File: ${storagePath}/${imageName}")
            return "${storagePath}/${imageName}"
        } else {
            println "File: ${file.inspect()} was empty"
            return null
        }
    }

//    private generateMD5(final file) {
//        MessageDigest digest = MessageDigest.getInstance("MD5")
//        file.getInputStream(){is->
//            byte[] buffer = new byte[8192]
//            int read = 0
//            while( (read = is.read(buffer)) > 0) {
//                digest.update(buffer, 0, read);
//            }
//        }
//        byte[] md5sum = digest.digest()
//        BigInteger bigInt = new BigInteger(1, md5sum)
//        return bigInt.toString(16)
//    }

    private addOnePhoto(String albumName, def desc, def location) {
        def now = new Date();
        def createTime = now.format("dd/MMM/yyyy", TimeZone.getTimeZone("GMT"))
        if (!Albums.findAllByAlbumName(albumName)) {
            //if the album doesn't exist, create a new one

            def a = new Albums()
            a.albumName = albumName
            a.year = createTime
            a.picsAccount = 0
            a.save()



            def p = new Photos();
            p.createTime = createTime
            p.likeAccount = 0;
            p.photoDesc = desc
            p.albumName = albumName
            p.location = location
            a.addToPics(p)
            a.picsAccount+=1;
            a.save()
            p.save()


        } else {
            // else, add the pic to the existing album
            def b = Albums.findByAlbumName(albumName)

            def p = new Photos();
            p.createTime = createTime
            p.likeAccount = 0;
            p.photoDesc = desc
            p.albumName = albumName
            p.location = location

            b.addToPics(p)
            b.picsAccount += 1;
            b.save()
            p.save()
//            b.each {it->
//                it.addToPics(p)
//                it.picsAccount+=1
//                it.save()
//            }


        }
    }

//    def listPics(){
//        String albumName= params.albumName
//
//        def photos = Photos.findAllByAlbumName(albumName)
//
//        def model = [:]
//        model.photos = photos
//
//        render(view: "photos",model: model)
//
//    }

}
