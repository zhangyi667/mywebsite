package mywebsite

class Albums {

    String albumName
    Integer picsAccount
    Integer year



    static hasMany = [pics:Photos]

    static constraints = {
          pics nullable: true

    }
}
