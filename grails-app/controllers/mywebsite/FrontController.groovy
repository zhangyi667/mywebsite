package mywebsite

import org.codehaus.groovy.grails.web.context.ServletContextHolder

class FrontController {

    static def dir = "/me/"

    def index() {
//       if (Front.count == 0){
//           def f = new Front(name: "Yi Zhang",signature: "Hello!", email: "testemail@123.com",twitter: "I still don't do twitter",
//                   welcome: "Welcome to my place",websiteIntro: "website intro",selfIntro: "This is me.").save()
//
//       }
//
//           def user = Front.findAll()
//
        def model = [:]

        def user = Front.findByName("Zhang Yi")
        def file = new File("web-app" + user.location).text
        def records = new XmlParser().parseText(file)
        def welcome = records.welcome.text()
        def webinfoTitle = records.webinfo.title.text()
        def webinfoContent = records.webinfo.content.text()
        def selfIntroTitle = records.selfIntro.title.text()
        def selfIntroContent = records.selfIntro.content.text()
        model.name = user.name
        model.email = user.email
        model.twitter = user.twitter
        model.welcome = welcome
        model.webinfoTitle = webinfoTitle
        model.webinfoContent = webinfoContent
        model.selfIntroTitle = selfIntroTitle
        model.selfIntroContent = selfIntroContent
        model.signature = user.signature



        render(view: "front",model: model)
//           render(view: "front",model: model)
        return


    }

//    def updateFront(){
//
//        def f = new Front(name: "Yi Zhang",signiture: "Hello!", email: "testemail@123.com",twitter: "I still don't do twitter",
//                welcome: "Welcome to my place",websiteIntro: "website intro",selfIntro: "This is me.", projectLog: "This is the project log").save()
//
//          redirect(action: index())
//           return
//
//
//    }


    def update() {
        if (params.code != "zhangyi") {
            redirect(action: index())
            return

        } else {
            render(view: "update")
            return


        }


    }



    def upload() {
        def file = request.getFile('uploadFile')

//        def md5 = generateMD5(file)
        String signature = params.signature
        String email = params.email
        String twitter = params.twitter


        String meName = java.util.UUID.randomUUID().toString();
        meName += ".xml"


        def fileType = file.getContentType()



        String fileUploaded = uploadFile(file, meName, dir)

        if (fileUploaded) {

            addFront(signature, email, twitter, dir + meName)
//            file.transferTo(new File("${dir}${baseImageName}.jpg"))
        } else {
            // handle when uploading fails

        }


        redirect(view: "update")
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


    private addFront(String signature, String email, String twitter, String location) {


        def f = new Front();
        f.email = email
        f.location = location
        f.twitter = twitter
        f.signature = signature
        f.name = "Zhang Yi"
        f.save()


    }

    private changeFront(String signature, String email, String twitter, String location) {


        def f = Front.findByName("Zhang Yi")
        if (email)
            f.email = email
        if (location)
            f.location = location
        if (twitter)
            f.twitter = twitter
        if (signature)
            f.signature = signature


        f.save()


    }

    def changeStatus() {
        def file = request.getFile('uploadFile')

//        def md5 = generateMD5(file)
        String signature = params.signature
        String email = params.email
        String twitter = params.twitter
        String fileUploaded
        String meName = java.util.UUID.randomUUID().toString();
        meName += ".xml"
        if (file.size){



            def fileType = file.getContentType()



             fileUploaded = uploadFile(file, meName, dir)
        }



         if (fileUploaded)
             changeFront(signature, email, twitter, dir + meName)
        else
             changeFront(signature, email, twitter, null)



        redirect(action: index())
        return

    }


}
