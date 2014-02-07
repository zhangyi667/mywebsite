package mywebsite

class FrontController {

    def index() {
       if (Front.count == 0){
           def f = new Front(name: "Yi Zhang",signiture: "Hello!", email: "testemail@123.com",twitter: "I still don't do twitter",
                   welcome: "Welcome to my place",websiteIntro: "website intro",selfIntro: "This is me.", projectLog: "This is the project log").save()

       }

           def user = Front.get(1)

           def model = [:]
           model.name = user.name

           render(view: "front",model: model)
           return



    }


    def updateFront(){

        def f = new Front(name: "Yi Zhang",signiture: "Hello!", email: "testemail@123.com",twitter: "I still don't do twitter",
                welcome: "Welcome to my place",websiteIntro: "website intro",selfIntro: "This is me.", projectLog: "This is the project log").save()

          redirect(action: index())
           return


    }
}
