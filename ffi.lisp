(in-package :cl-crypto)

(cl+ssl::define-crypto-function ("BIO_s_mem" bio-s-mem) :pointer)

(cl+ssl::define-crypto-function ("BIO_new" bio-new) :pointer (type :pointer))

(cl+ssl::define-crypto-function ("BIO_write" bio-write) :int (bo :pointer) (str :string) (len :int))

(cl+ssl::define-crypto-function ("BIO_read" bio-read) :int (bo :pointer) (str :pointer) (len :int))

(cl+ssl::define-crypto-function ("PEM_read_bio_RSAPrivateKey" pem-read-bio-rsa-privkey) :pointer
  (bp :pointer)
  (rsa :pointer)
  (pem-password-cp :pointer)
  (u :pointer))

(cl+ssl::define-crypto-function ("RSA_sign" rsa-sign) :int
  (type :int)
  (str :pointer)
  (len :int)
  (out :pointer)
  (len-out :pointer)
  (rsa :pointer))

(cl+ssl::define-crypto-function ("SHA1" sha1) :pointer
  (input :pointer)
  (len :int)
  (output :pointer))

(cl+ssl::define-crypto-function ("SHA256" sha256) :pointer
  (input :pointer)
  (len :int)
  (output :pointer))

(cl+ssl::define-crypto-function ("RSA_size" rsa-size) :int
  (key :pointer))


(defparameter +RSA_PKCS1_1_PADDING+ 1)
(defparameter +RSA_SSLV23_PADDING+ 2)
(defparameter +RSA_NO_PADDING+ 3)
(defparameter +RSA_PKCS1_OAEP_PADDING+ 4)

(cl+ssl::define-crypto-function ("RSA_public_encrypt" rsa-encrypt) :int
  (len :int)
  (message :pointer)
  (output :pointer)
  (key :pointer)
  (padding-type :int))
  
