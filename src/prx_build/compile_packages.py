import sys,os;
import ast;
import shutil;

def clear_cmake():

    shutil.copy2(".BuildFiles/CMakeListsUtilities.txt","../prx_utilities/CMakeLists.txt");
    shutil.copy2(".BuildFiles/CMakeListsPlanning.txt","../prx_planning/CMakeLists.txt");
    shutil.copy2(".BuildFiles/CMakeListsSimulation.txt","../prx_simulation/CMakeLists.txt");
    shutil.copy2(".BuildFiles/CMakeListsVisualization.txt","../prx_visualization/CMakeLists.txt");
    return;
    found = False;
    f = open("../prx_utilities/CMakeLists.txt");
    infile = f.readlines();
    with open("../prx_utilities/CMakeLists.txt","w") as outfile:
        for i,line in enumerate(infile):
            if "### PACKAGES" in line:
                found = True;
                outfile.write(line);
            elif "### END PACKAGES" in line:
                found = False;
                outfile.write(line);
            elif not found:
                outfile.write(line);
                    
    f = open("../prx_simulation/CMakeLists.txt");
    infile = f.readlines();
    with open("../prx_simulation/CMakeLists.txt","w") as outfile:
        for i,line in enumerate(infile):
            if "### PACKAGES" in line:
                found = True;
                outfile.write(line);
            elif "### END PACKAGES" in line:
                found = False;
                outfile.write(line);
            elif not found:
                outfile.write(line);
    f = open("../prx_planning/CMakeLists.txt");
    infile = f.readlines();
    with open("../prx_planning/CMakeLists.txt","w") as outfile:
        for i,line in enumerate(infile):
            if "### PACKAGES" in line:
                found = True;
                outfile.write(line);
            elif "### END PACKAGES" in line:
                found = False;
                outfile.write(line);
            elif not found:
                outfile.write(line);


def clear_plugin():
    shutil.copy2(".BuildFiles/utilities_plugin.xml","../prx_utilities/utilities_plugin.xml");
    shutil.copy2(".BuildFiles/planning_plugin.xml","../prx_planning/planning_plugin.xml");
    shutil.copy2(".BuildFiles/simulation_plugin.xml","../prx_simulation/simulation_plugin.xml");
    return;


    found = False;
    f = open("../prx_utilities/utilities_plugin.xml");
    infile = f.readlines();
    with open("../prx_utilities/utilities_plugin.xml","w") as outfile:
        for i,line in enumerate(infile):
            if "<!-- PACKAGES -->" in line:
                found = True;
                outfile.write(line);
            elif "<!-- END PACKAGES -->" in line:
                found = False;
                outfile.write(line);
            elif not found:
                outfile.write(line);
    
    f = open("../prx_simulation/simulation_plugin.xml");
    infile = f.readlines();
    with open("../prx_simulation/simulation_plugin.xml","w") as outfile:
        for i,line in enumerate(infile):
            if "<!-- PACKAGES -->" in line:
                found = True;
                outfile.write(line);
            elif "<!-- END PACKAGES -->" in line:
                found = False;
                outfile.write(line);
            elif not found:
                outfile.write(line);
    f = open("../prx_planning/planning_plugin.xml");
    infile = f.readlines();
    with open("../prx_planning/planning_plugin.xml","w") as outfile:
        for i,line in enumerate(infile):
            if "<!-- PACKAGES -->" in line:
                found = True;
                outfile.write(line);
            elif "<!-- END PACKAGES -->" in line:
                found = False;
                outfile.write(line);
            elif not found:
                outfile.write(line);

def modify_plugins():
    package_directories = [("utilities","utilities_plugin"),("simulation","simulation_plugin"),("planning","planning_plugin")];
    for x in package_directories:
        folders_file = open("packages.config");
        found = False;
        folders = folders_file.readlines();
        for j,pkg in enumerate(folders):
            tup = ast.literal_eval(pkg);
            if tup[1] == 1 and os.path.isdir("../prx_packages/"+tup[0]+"/"+x[0]):
                #f = open(".BuildFiles/"+x[1]+".xml");
                f = open("../prx_"+x[0]+"/"+x[1]+".xml");
                infile = f.readlines();
                with open("../prx_"+x[0]+"/"+x[1]+".xml","w") as outfile:
                    for i,line in enumerate(infile):
                        if "<!-- PACKAGES -->" in line:
                            found = True;
                            outfile.write(line)
                        else:
                            if found:
                                plugin_file = open("../prx_packages/"+tup[0]+"/"+x[0]+"/plugin.xml");
                                text = plugin_file.read();
                                outfile.write(text);
                                outfile.write("\n");
                                found = False;
                            outfile.write(line);

def modify_cmakes(compile_mode):
    package_directories = [("Utilities","UTILITIES"),("Simulation","SIMULATION"),("Planning","PLANNING")];
    for x in package_directories:
        folders_file = open("packages.config");
        found = False;
        f = open("../prx_"+x[0].lower()+"/CMakeLists.txt");
        infile = f.readlines();
        with open("../prx_"+x[0].lower()+"/CMakeLists.txt","w") as outfile:
            for i,line in enumerate(infile):
                if "set(ROS_BUILD_TYPE" in line:
                    outfile.write("set(ROS_BUILD_TYPE "+compile_mode+")\n")
                else:
                    outfile.write(line)
        folders = folders_file.readlines();
        for j,pkg in enumerate(folders):
            tup = ast.literal_eval(pkg);
            if tup[1] == 1 and os.path.isdir("../prx_packages/"+tup[0]+"/"+x[0].lower()):
                #f = open(".BuildFiles/CMakeLists"+x[0]+".txt");
                f = open("../prx_"+x[0].lower()+"/CMakeLists.txt");
                infile = f.readlines();
                with open("../prx_"+x[0].lower()+"/CMakeLists.txt","w") as outfile:
                    for i,line in enumerate(infile):
                        if "### PACKAGES" in line:
                            found = True;
                            outfile.write(line)
                        else:
                            if found:
                                outfile.write("get_filename_component(PARENT_DIR \"${CMAKE_SOURCE_DIR}\" PATH)\n");
                                outfile.write("include_directories(${PARENT_DIR}/prx_packages/"+tup[0]+")\n");
                                outfile.write("file(GLOB_RECURSE SRC_"+tup[0]+" ${PARENT_DIR}/prx_packages/"+tup[0]+"/"+x[0].lower()+"/*.cpp)\n");
                                outfile.write("set(SRC_"+x[1]+" ${SRC_"+tup[0]+"} ${SRC_"+x[1]+"})\n");
                                outfile.write("\n");
                                found = False;
                            outfile.write(line);


clear_cmake();
clear_plugin();
if len(sys.argv) <2:
    modify_cmakes("Debug");
else:
    modify_cmakes(sys.argv[1]);
modify_plugins();



