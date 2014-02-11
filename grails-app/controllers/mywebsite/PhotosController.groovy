package mywebsite

import org.codehaus.groovy.grails.web.context.ServletContextHolder

class PhotosController {

    static def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']
    static String dir = "/images/photos/"
    static int maxResults = 10 //number of pics loaded per request


    def index() {

        def c = Photos.createCriteria()
         def photos
        if (params.albumName)  {

            photos = c{
                eq("albumName",params.albumName)
                order("createTime","desc")
                maxResults(maxResults)
            }
        }


        else {

            photos = c{
                order("createTime","desc")
                maxResults(maxResults)

            }
        }

        def model = ['photos':photos]
        model.current = maxResults
        render(view: "photos",model: model)
    }


    def getMorePics(){
        def model = [:]
         int currentNumber = params.current
        def album = params.albumName
        def allPhotos
        if (album)
            allPhotos =  Photos.findAllByAlbumName(album)
        else
            allPhotos = Photos.findAll()

        def photos

        int  size =photos.size()
        if (size < currentNumber + maxResults -1){
            // if the album doesn't have so many photos, return the rest of it
            photos = allPhotos.subList(currentNumber, size-1)
            
            
        }   else{
            
            photos = allPhotos.subList(currentNumber,currentNumber+maxResults-1)
        }


        model.photos = photos
        model.current = currentNumber+10
        render(view: "photos",model: model)



    }



    def upload(){
        def file = request.getFile('uploadFile')

//        def md5 = generateMD5(file)
        String albumName = params.albumName

        String baseImageName = java.util.UUID.randomUUID().toString();


        def fileType = file.getContentType()
        if (!okContentTypes.contains(fileType)) {
            flash.message = "Image type must be one of: ${okContentTypes}"

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



        String fileUploaded = uploadFile( file, baseImageName, dir )

        if (fileUploaded){

            addOnePhoto(albumName,params.desc,dir+baseImageName)

//            file.transferTo(new File("${dir}${baseImageName}.jpg"))
        }   else{
            // handle when uploading fails

        }


    }

    def uploadFile(def file, String imageName, String destinationDirectory) {
        def serveletContext = ServletContextHolder.servletContext
        def storagePath =  serveletContext.getRealPath( destinationDirectory )
//       def storagePath = "http://localhost"+destinationDirectory
        def storagePathDirectory = new File( storagePath )

        if( !storagePathDirectory.exists() ){
            println("creating directory ${storagePath}")
            if(storagePathDirectory.mkdirs()){
                println "SUCCESS"
            }else{
                println "FAILED"
            }
        }

        // Store file

        if(!file.isEmpty()){
            file.transferTo( new File("${storagePath}/${imageName}") )
            println("Saved File: ${storagePath}/${imageName}")
            return "${storagePath}/${imageName}"
        }else{
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

        if (!Albums.findAllByAlbumName(albumName)) {
            //if the album doesn't exist, create a new one

            def a = new Albums()
            a.albumName = albumName
            a.year = 1
            a.picsAccount=0
            a.save()

            def p = new Photos();
            p.createTime = 1
            p.likeAccount = 0;
            p.photoDesc = desc
            p.albumName = albumName
            p.location = location
            a.addToPics(p)
            a.picsAccount+1;
            a.save()
            p.save()



        }else{
            // else, add the pic to the existing album
            def b =  Albums.findByAlbumName(albumName)

            def p = new Photos();
            p.createTime = 1
            p.likeAccount = 0;
            p.photoDesc = desc
            p.albumName = albumName
            p.location = location

            b.addToPics(p)
            b.picsAccount+1;
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
