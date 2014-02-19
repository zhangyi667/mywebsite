class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "front")
		"500"(view:'/error')
        "/updatenimei"(controller: "front",action: "update")

	}
}
