dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
//    username = "sa"
//    password = ""
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            url = "jdbc:mysql://localhost:2345/aaa?useUnicode=yes&characterEncoding=UTF-8"
            username = "yi"
            password = "1234"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            url = "jdbc:mysql://localhost:2345/bbb?useUnicode=yes&characterEncoding=UTF-8"
            username = "yi"
            password = "1234"

        }
    }
    production {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            url = "jdbc:mysql://yizhang-west2-mysql-instance1.cfszty0kvi1j.eu-west-1.rds.amazonaws.com:3306/aaa?user=yi&password=1234&useUnicode=yes&characterEncoding=UTF-8"
//            username = "yi "
//            password = "1234"
            url = "jdbc:mysql://localhost:2345/bbb?useUnicode=yes&characterEncoding=UTF-8"
            username = "yi"
            password = "1234"
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://{endpoint}:{port_number}/ebdb?user={user}&password={password}"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
