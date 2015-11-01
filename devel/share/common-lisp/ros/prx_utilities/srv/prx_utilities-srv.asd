
(cl:in-package :asdf)

(defsystem "prx_utilities-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :prx_utilities-msg
)
  :components ((:file "_package")
    (:file "visualize_ghost_plants_srv" :depends-on ("_package_visualize_ghost_plants_srv"))
    (:file "_package_visualize_ghost_plants_srv" :depends-on ("_package"))
    (:file "visualize_plant_srv" :depends-on ("_package_visualize_plant_srv"))
    (:file "_package_visualize_plant_srv" :depends-on ("_package"))
    (:file "visualize_obstacles_srv" :depends-on ("_package_visualize_obstacles_srv"))
    (:file "_package_visualize_obstacles_srv" :depends-on ("_package"))
    (:file "update_twoD_text_srv" :depends-on ("_package_update_twoD_text_srv"))
    (:file "_package_update_twoD_text_srv" :depends-on ("_package"))
    (:file "describe_geometries_srv" :depends-on ("_package_describe_geometries_srv"))
    (:file "_package_describe_geometries_srv" :depends-on ("_package"))
    (:file "update_info_geoms_srv" :depends-on ("_package_update_info_geoms_srv"))
    (:file "_package_update_info_geoms_srv" :depends-on ("_package"))
    (:file "create_HUD_srv" :depends-on ("_package_create_HUD_srv"))
    (:file "_package_create_HUD_srv" :depends-on ("_package"))
    (:file "take_screenshot_srv" :depends-on ("_package_take_screenshot_srv"))
    (:file "_package_take_screenshot_srv" :depends-on ("_package"))
    (:file "add_HUD_element_srv" :depends-on ("_package_add_HUD_element_srv"))
    (:file "_package_add_HUD_element_srv" :depends-on ("_package"))
    (:file "add_twoD_text_srv" :depends-on ("_package_add_twoD_text_srv"))
    (:file "_package_add_twoD_text_srv" :depends-on ("_package"))
  ))