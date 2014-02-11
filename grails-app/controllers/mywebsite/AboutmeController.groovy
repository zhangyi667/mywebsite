package mywebsite

class AboutmeController {

    def index() {

        render(view: "selfintro")
    }

    def experience(){
        render(view: "experiences")

    }
}
