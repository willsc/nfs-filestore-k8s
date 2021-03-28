provider "google" {}
data "google_client_config" "current" {}
module "filestore" {
    source = "../"
    instance_id = "testing"
    #project = "${data.google_client_config.current.project}"
    project = "inspiring-cat-308916"
    location = "europe-west2-a"
    file_share = {
        capacity = "1TB"
        name = "share_test"

    }

    network = {
        name = "default"
        reserved_ip_range = "10.217.22.0/29"


    }
    description = "NFS test instance"
    labels = {
        foo = "foo"
        baz = "bar"
    }
}

output "filestore_ip" {
    value = "${module.filestore.filestore_ip}"
}



module "filestore1" {
    source = "../"
    instance_id = "testingfoo"
    #project = "${data.google_client_config.current.project}"
    project = "inspiring-cat-308916"
    location = "europe-west2-a"
    file_share = {
        capacity = "1TB"
        name = "foo_share_test"

    }

    network = {
        name = "default"
        reserved_ip_range = "10.218.22.0/29"


    }
    description = "NFS test instance"
    labels = {
        foo = "foo"
        baz = "bar"
    }
}

output "filestore_ip1" {
    value = "${module.filestore1.filestore_ip}"

}