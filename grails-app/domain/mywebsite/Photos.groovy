package mywebsite

class Photos {

    String photoDesc
    Integer likeAccount
    String createTime
    String location
    String albumName

    static belongsTo = [album:Albums]

    static constraints = {
    }
}
