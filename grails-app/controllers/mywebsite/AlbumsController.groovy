package mywebsite

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.json.JSONObject

class AlbumsController {
    static def smallPicSize = 5


    def scafford = Albums


    def index() {
        // retrieve the albums of pics
        // add to model


        def model = getThePhotos()

        render(view: "albums", model: model)
        return


    }

    def getThePhotos() {

        //get all albums
        def albums = [] as JSONObject;

        def albumsFromDatabase = Albums.list();

        // what i need: album name, the first to the fifth pics in each album


        def model = [] as JSONObject





        for (a in albumsFromDatabase) {

            def album = [] as JSONObject
            album.albumName = a.albumName
            album.year = a.year
            album.picsCount = a.picsAccount

            def allPhotos = Photos.findAllByAlbumName(a.albumName)

            def firstPic = allPhotos.last()?.location

            def allPhotoSize = allPhotos.size()
            def temp
            if (allPhotoSize == 0) {
                temp = ["", "", "", ""]


            } else {
                temp = []

                for (int i = 0; i <= 3; i++) {
                    if (allPhotoSize < smallPicSize - i)
                        temp[i] = ""
                    else
                        temp[i] = allPhotos.getAt(allPhotoSize + i - smallPicSize).location

                }

//
//                temp[0] =   allPhotos.getAt(allphotoSize - 5)?allPhotos.getAt(allphotoSize - 5).location :""
//                temp[1] =   allPhotos.getAt(allphotoSize - 4)?allPhotos.getAt(allphotoSize - 4).location :""
//                temp[2] =   allPhotos.getAt(allphotoSize - 3)?allPhotos.getAt(allphotoSize - 3).location :""
//                temp[3] =   allPhotos.getAt(allphotoSize - 2)?allPhotos.getAt(allphotoSize - 2).location :""

//                if (allphotoSize > 5) {
//                    smallPics = allPhotos.getAt(allPhotos.size() - 5)
//                    allPhotos.subList(allphotoSize - 5, allphotoSize - 1)
//
//
//                } else {
//                    if (allphotoSize == 1)
//                        smallPics = new ArrayList()
//                    else if (allphotoSize == 2)
//                        smallPics.add( allPhotos.getAt(0))
//                    else
//                        smallPics.add(allPhotos.getAt(0, allphotoSize - 2))
//
//
//                }

//                for (int i = 0; i <= 3; i++) {
//
//                    if (smallPics.getAt(i)) {
//                        temp.add(smallPics.getAt(i).location)
//
//                    } else {
//                        temp.add("")
//
//                    }
//
//                }

//            def serveletContext = ServletContextHolder.servletContext
//            def storagePath = serveletContext.getRealPath( firstPic )
//            firstPic = ServletContextHolder.servletContext.getRealPath(firstPic)

            }

            album.smallPics = temp
            album.firstPic = firstPic
            albums.put(a.albumName, album)


        }
        model.albums = albums
        return model
    }

//    def update() {
//        //albumName is fetched from submitting
//
////        addOnePhoto("me","This is me","photos/me.jpg")
////        addOnePhoto("rat","A rat","tuzi.gif")
////        addOnePhoto("me","Me and my friend","phtots/IMG_9613.jpg")
////        addOnePhoto("rat","Me and my friend","photos/IMG_3220 copy.jpg")
//
//
//
//
//        def model = getThePhotos()
//        render(view: "albums",model: model)
//        return
//
//
//    }

    def addOnePhoto(String albumName, String desc, String location) {

        if (!Albums.findAllByAlbumName(albumName)) {
            //if the album doesn't exist, create a new one

            def a = new Albums()
            a.albumName = albumName
            a.year = 1
            a.picsAccount = 0
            a.save()

            def p = new Photos();
            p.createTime = 1
            p.likeAccount = 0;
            p.photoDesc = desc
            p.albumName = albumName
            p.location = location
            a.addToPics(p)
            a.picsAccount + 1;
            a.save()
            p.save()


        } else {
            // else, add the pic to the existing album
            def b = Albums.findByAlbumName(albumName)

            def p = new Photos();
            p.createTime = 1
            p.likeAccount = 0;
            p.photoDesc = desc
            p.albumName = albumName
            p.location = location

            b.addToPics(p)
            b.picsAccount + 1;
            b.save()
            p.save()
//            b.each {it->
//                it.addToPics(p)
//                it.picsAccount+=1
//                it.save()
//            }


        }
    }
}
