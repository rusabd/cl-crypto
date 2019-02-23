(asdf:defsystem #:cl-crypto
  :license "MIT"
  :author "Ruslan Abdulkhalikov"
  :depends-on ("cl+ssl"
	       "cl-base64")
  :components ((:file "package")
               (:file "ffi")
               (:file "digest")
               (:file "rsa")))

(asdf:defsystem #:cl-crypto-test
  :depends-on (:cl-crypto
               :prove)
  :defsystem-depends-on (:prove-asdf)
  :components ((:test-file "tests"))
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run) :prove) c)))

