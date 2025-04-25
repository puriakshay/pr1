variable "envrg" {}
variable "envvn" {}
variable "envsn" {}
variable "envni" {}
variable "envnsg" {}
variable "envnsgni" {}
variable "envpi" {}

module "rg-mod" {
    source = "../RG"
    varsrg = var.envrg
}
module "vn-mod" {
    source = "../VN"
  varsvn = var.envvn
  depends_on = [ module.rg-mod ]
}
module "sn-mod" {
    source = "../SN"
    varsn = var.envsn
   depends_on = [ module.vn-mod ]
}
module "pi-mod" {
    source = "../PI"
    varspi = var.envpi
   depends_on = [ module.rg-mod ]
}
module "ni-mod" {
    source = "../NI"
    varsni = var.envni
    datasnid = var.envsn
    datapiid =var.envpi
    depends_on = [module.ni-mod,module.sn-mod,module.rg-mod]
}