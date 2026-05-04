
variable "storage-acct" {
    type = map(object({
      name = string
      replication = string
      tags =  map(string)
    }))

    default = {
      "storage1" = {
        name = "bmwstorage01"
        replication = "LRS"
        tags = {
            "owner" = "kunal yeole"
            "use" = "spare parts logs"
        }     
      }

      "storage2" = {
        name = "bmwstorage02"
        replication = "ZRS"
        tags = {
            "owner" = "kunal yeole"
            "use" = "sales logs"
        } 
      }

      "storage3" = {
        name = "bmwstorage03"
        replication = "ZRS"
        tags = {
            "owner" = "kunal yeole"
            "use" = " data analystics logs"
        }
      }

    }
  
}