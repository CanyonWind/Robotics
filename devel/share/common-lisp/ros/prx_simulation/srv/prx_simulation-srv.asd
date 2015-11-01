
(cl:in-package :asdf)

(defsystem "prx_simulation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :prx_simulation-msg
)
  :components ((:file "_package")
    (:file "request_ground_truth_srv" :depends-on ("_package_request_ground_truth_srv"))
    (:file "_package_request_ground_truth_srv" :depends-on ("_package"))
    (:file "request_space_information_srv" :depends-on ("_package_request_space_information_srv"))
    (:file "_package_request_space_information_srv" :depends-on ("_package"))
    (:file "send_lqr_srv" :depends-on ("_package_send_lqr_srv"))
    (:file "_package_send_lqr_srv" :depends-on ("_package"))
    (:file "set_sim_state_srv" :depends-on ("_package_set_sim_state_srv"))
    (:file "_package_set_sim_state_srv" :depends-on ("_package"))
    (:file "send_plans_srv" :depends-on ("_package_send_plans_srv"))
    (:file "_package_send_plans_srv" :depends-on ("_package"))
  ))