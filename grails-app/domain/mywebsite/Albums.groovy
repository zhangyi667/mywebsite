package mywebsite

class Albums {

    String albumName
    Integer picsAccount
    String year



    static hasMany = [pics:Photos]

    static constraints = {
          pics nullable: true

    }
}
