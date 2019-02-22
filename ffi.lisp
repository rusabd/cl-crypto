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

(defparameter *test-rsa-key* "-----BEGIN RSA PRIVATE KEY-----
MIIEoQIBAAKCAQEAuyOgR3XbnW+wLpF16BZJJiRbh60HKqbeAM75qcgUZU/IAOi+
h50QL8sVeZ6Uq00ttE1HHruoN7E7KHpTbsIrsmpgDRLVEZAOG/uBnxIBkpRdkLhn
CvjKLi0sulQqbY9P5xQ1ZivPTYuLsJmLX63nLZe0a3Ui4oo6y0Pt1InCymQY+L2/
YjgHbZvF/bL1I8m4nV1ELME8VT8FjXuOmEbdQCKcvzseqbxZjnGCuc56Dy9wWEXI
pF+iSbsdDGK018Z7K0nY14utrqUQ7Pd4zXpe0RjQ5+epgMlIZ8U6MEtkymaq51Ty
GiyyyMpOUCK4HdIvPoX1ByvPk6fgfXVf4O+rrwIBJQKCAQEAjZ5rdFkwktEPtInB
AqkUwusU1WBYc03Yb1CFlT13N+lZFXHcSvNmMgF4CQJiqyWmC+d0F0HnFWOGttkc
iysn/KOG9SMCGyDoFS0IJVm8ADjs3DiFVGk/DjAGLCQEbpX3RxY2P3sZax1+d84k
SGftN0JfBTYMj8KNW41aCJ+aU/dsmqCibEkzRocqooIRuUMUh6P3vRKJKQUdN72N
GvH0vLfgzI+dOSZvQNDuPFjuqUp42cwVvvbWW/hJk78YsXbgnBZ1j6f+KMrCOzzD
D9SpZvckmSRMZ5UlJYOdmJoqjywXV60O2ATcMHTALlxebQ1jY4oLqLAnRYdR8Nnv
436tTQKBgQDtNrgZPhrt2EkJhn0YBP/ZH9qrFvSq2NL+4oeaxBV3/whcjbnyEv0U
DTr80lklmH1cy8jlpkSVTGOQ638bdiMgz5T/wmko0yVzZz4EMYyYLMkFmgE4H7yX
JxbvVTwf390FtdswUAagwDed2M9EHEyAp/m5asRXNnT2KFuNstogywKBgQDJ9bFh
y+DxQUSx11MhINXNgSDIks+Az1wgDwKd8JY9R7mN/p7Tr8x7omuUPEj0hLQ8/vhY
iucolhiYnacULf0fRE4G4HI+JZhBbk27/d3myfbtOmQw/L53Bfc6moyxP6Gq61US
vvsTo/hpXqKJg7P9id71WOxpCnb06R5neFK4LQKBgAzShn3nrm24qgCDz2kVBukk
UQJURJOdBHx68pK+fbN1kb/QTz2EfGHy4JgLXsPDDbH9LXQygD9r6bTOdZLIHZMS
I7rMPQkgK4myjbsJmOWhjlNUbsTDcfpVI9WV55MFLoqv4lWjdfrZ9SsgeegBh5hA
bl0MsKrErGBVNWGa9wixAoGAfYrj4tiubHSuKVxWRQaSvgQpIrwgH6N+dMsPdu9/
/JRelomFUygXU8XUK7bFkRQ4sEt3yFZYV3/lxqcwgips6ewwgNC1t+3bL5eYGunq
zbvQ2KfBvZYxNTsPTfFeYFf8tlrvsbT88IiFqUiqOc5o940ODiKFHrN6YOPwTigz
a5ECgYAj7VGrQy6Esjmi8irrFmMX1CodSbdJJfAbwdYhcCDCsClZcLLHDABFY/Pt
zvbsIFCGIyrGU5kVTX/xGU46sSJGTfxnpoAHai4L4y3FjzBiQ2aqpkNVW7zz1gQm
yxHyXoZ9ZQYtiaF/24oKUmuJ52+fm1ih0HXJGv2hQW4Zes0TvQ==
-----END RSA PRIVATE KEY-----
")

