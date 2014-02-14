package mywebsite

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.json.JSONObject

class NotesController {
//    static def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']
    static def okContentTypes = []
    static String dir = "/blogs/"


    def index() {

//        def file = new File("/home/yi/work/myprojects/mywebsite/web-app/test.txt")
//
//        // Success.
//
//        String a = file.text.replace("\n","<br>")
//
//      def model =  [log: a.subSequence(0,50)]
//    render(view: "notes",contentType: "text/html", model: model)

        // start
        def c = Notes.createCriteria()
        if (params.id) {



            def b = Notes.findById(params.id)
            if (b == null){
                    flash.message = "Error happened. Cannot find the blog."
                redirect(action: "index")
                return

            }   else{
                def model = [] as JSONObject
                def blog = [] as JSONObject
                blog.title = b.title
                blog.createTime = b.createTime
                def file = new File(b.location).text.replace("\n","<br>");
                blog.log = file //Do not show the full article.
                model.put(b.id,blog)

                render(view: "notes", model: ['blogs':model])
                return

            }


        } else {
            def blogs = c {

                order("id", "desc")
            }



            def model = []  as JSONObject

            for (b in blogs){
                def blog = [] as JSONObject
                blog.title = b.title
                blog.createTime = b.createTime
                def file = new File(b.location).text.replace("\n","<br>");
                blog.log = file
                model.put(b.id,blog)
            }


            render(view: "notes", model: ['blogs':model,'short':true])
            return
        }


    }


    def singleBlog() {

        def id = params.id


        if (id) {
            def blog = Notes.findById(id);

            def model = ['blog':blog]

            render(view: "blog",model: model)
             return
        } else {

            redirect(action:"index")

        }


    }


    def upload() {
        def file = request.getFile('uploadFile')

//        def md5 = generateMD5(file)
        String title = params.title

        String blogName = java.util.UUID.randomUUID().toString();


        def fileType = file.getContentType()



        String fileUploaded =  uploadFile(file, blogName, dir)

        if (fileUploaded) {

            addOneBlog(title, fileUploaded)

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


    private addOneBlog(String title, String location) {
        def now = new Date();
        def createTime = now.format("dd/MMM/yyyy", TimeZone.getTimeZone("GMT"))

        if (Notes.findByTitle(title)){

             title +="_replace"

        }

        def b = new Notes();
        b.title = title;
        b.createTime = createTime;
        b.location = location;
        b.save();




    }



}
