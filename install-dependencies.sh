#!/bin/bash
# Installing dependencies needed to build on (k)ubuntu linux 20.04

# Check USE_THERMOFUN mode install dependecy
if [ "$(uname)" == "Darwin" ]; then

    # Do under Mac OS X platform
    #brew upgrade
    #brew install cmake
    EXTN=dylib

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

    sudo apt-get update
    EXTN=so
fi


threads=3
git status
USING_THERMOFUN_MODE=$1
BRANCH_TFUN=master
BRANCH_GEMS3K=master

# Temporarily uncomment rows for packages that need to be re-installed
#sudo rm -rf /usr/local/include/nlohmann
#sudo rm -rf /usr/local/include/eigen3/Eigen/Eigen
#sudo rm -rf /usr/local/include/pybind11
#sudo rm -rf /usr/local/include/spdlog
#sudo rm -f  /usr/local/lib/libChemicalFun.$EXTN
#sudo rm -f  /usr/local/lib/libThermoFun.$EXTN
#sudo rm -f  /usr/local/lib/libGEMS3K.$EXTN

# spdlog
# if no spdlog installed in /usr/local/include/spdlog (copy only headers)
test -d /usr/local/include/spdlog || {

        # Building spdlog library
        mkdir -p ~/code && \
                cd ~/code && \
                git clone https://github.com/gabime/spdlog  && \
                cd spdlog/include && \
                sudo cp -r spdlog /usr/local/include

        # Removing generated build files
        cd ~ && \
                 rm -rf ~/code
}


if [ "$USING_THERMOFUN_MODE" == "NO_THERMOFUN" ];
  then
    echo "Using without ThermoFun calculations"

  else

# nlohmann/json
test -f /usr/local/include/nlohmann/json.hpp || {

        # Building yaml-cpp library
        mkdir -p ~/code && \
        cd ~/code && \
        git clone https://github.com/nlohmann/json.git && \
        cd json && \
        mkdir -p build && \
        cd build && \
        cmake .. -DCMAKE_BUILD_TYPE=Release -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=ON && \
        make && \
        sudo make install

        # Removing generated build files
        cd ~ && \
        rm -rf ~/code
}

# Eigen3 math library (added for building and installing xGEMS)
# if not installed in /usr/local/include/eigen3)
test -d /usr/local/include/eigen3/Eigen || {

        # Building eigen library
        mkdir -p ~/code && \
                cd ~/code && \
                git clone https://gitlab.com/libeigen/eigen.git -b 3.4.0 && \
                cd eigen && \
                mkdir -p build && \
                cd build && \
                cmake .. \
                make && \
                sudo make install

        # Removing generated build files
        cd ~ && \
                 rm -rf ~/code
}

#Pybind11
test -d /usr/local/include/pybind11 || {

        # Building yaml-cpp library
        mkdir -p ~/code && \
        cd ~/code && \
        git clone https://github.com/pybind/pybind11.git && \
        cd pybind11 && \
        mkdir -p build && \
        cd build && \
        cmake .. -DPYBIND11_TEST=OFF && \
        make && \
        sudo make install

        # Removing generated build files
        cd ~ && \
        rm -rf ~/code
}

# ChemicalFun library
# if no ChemicalFun installed in /usr/local/lib/ (/usr/local/include/ChemicalFun)
test -f /usr/local/lib/libChemicalFun.$EXTN || {

        # Building thermofun library
        mkdir -p ~/code && \
        cd ~/code && \
        git clone https://github.com/thermohub/chemicalfun.git -b $BRANCH_TFUN  && \
        cd chemicalfun && \
        mkdir -p build && \
        cd build && \
        cmake .. -DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_BUILD_TYPE=$BUILD_TYPE  && \
        make -j $threads && \
        sudo make install

        # Removing generated build files
        cd ~ && \
        rm -rf ~/code
}


# ThermoFun library
# if no ThermoFun installed in /usr/local/lib/libThermoFun.a (/usr/local/include/ThermoFun)
test -f /usr/local/lib/libThermoFun.$EXTN || {

        # Building thermofun library
        mkdir -p ~/code && \
        cd ~/code && \
        # git clone https://bitbucket.org/gems4/thermofun.git -b $BRANCH_TFUN && \
        git clone https://github.com/thermohub/thermofun.git -b $BRANCH_TFUN && \
        cd thermofun && \
        mkdir -p build && \
        cd build && \
        cmake .. -DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_BUILD_TYPE=Release && \
        make -j $threads && \
        sudo make install

        # Removing generated build files
        cd ~ && \
        rm -rf ~/code
}

fi

# GEMS3K library
# if no GEMS3K installed in /usr/local/lib/libGEMS3K.so (/usr/local/include/GEMS3K)
test -f /usr/local/lib/libGEMS3K.$EXTN || {

        # Building thermofun library
        mkdir -p ~/code && \
        cd ~/code && \
        git clone https://github.com/gemshub/GEMS3K -b $BRANCH_GEMS3K && \
        cd GEMS3K && \
        mkdir -p build && \
        cd build && \
        cmake .. -DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_BUILD_TYPE=Release && \
        make -j $threads && \
        sudo make install

        # Removing generated build files
        cd ~ && \
        rm -rf ~/code
}


if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
   sudo ldconfig
fi
# on MacOS, this gives a syntax error
