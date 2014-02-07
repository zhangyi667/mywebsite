package mywebsite

class AlbumsController {

    def scafford = Albums

    def a = Albums.get(1)

    def index() {
        // retrieve the albums of pics
        // add to model
        render(view: "albums")
        return

    }
}
