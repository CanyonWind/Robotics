
(cl:in-package :asdf)

(defsystem "prx_utilities-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "rigid_body_info_msg" :depends-on ("_package_rigid_body_info_msg"))
    (:file "_package_rigid_body_info_msg" :depends-on ("_package"))
    (:file "space_msg" :depends-on ("_package_space_msg"))
    (:file "_package_space_msg" :depends-on ("_package"))
    (:file "Vec4_msg" :depends-on ("_package_Vec4_msg"))
    (:file "_package_Vec4_msg" :depends-on ("_package"))
  ))