package mywebsite

class Photos {

    String photoDesc
    Integer likeAccount
    Integer createTime
    String location
    String albumName

    static belongsTo = [album:Albums]

    static constraints = {
    }
}
