package mywebsite

class Albums {

    String albumID
    String albumName
    String picsAccount
    Integer year


    static hasMany = [pics:Photos]

    static constraints = {
    }
}
