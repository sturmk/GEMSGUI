# GEM-Selektor v.3

Welcome to GEM-Selektor v3 program!

GEM-Selektor v.3 - the interactive package for thermodynamic modelling of aquatic (geo)chemical systems by Gibbs Energy Minimization using a built-in GEMS3K chemical solver.

## How to run GEM-Selektor

* To run GEM-Selektor application, execute the the gem-selektor.app

At the first attempt to start gem-selektor.app results in security alert about "unidentified developer", which requires to go in Settings Privacy & Security and give a special permission to run the program. 
Go to Settings / Privacy and Security, scroll down, and confirm to run gem-selector.app 

Another way to open a blocked app is to locate the app in a Finder window. 

    Open the Finder.
    Locate the app (it might be in the Applications folder, or it might still be in your downloads folder).
    Ctrl-click or right-click on the app.
    Select Open from the resultant menu and the app will be opened anyway, and an exception will be created for opening it normally (i.e. by double-clicking) in the future.

The next runs can be started by clicking on gem-selector.app in Finder or its index in the dock. It may be necessary to go to Settings / Privacy and Security, scroll down, and confirm to run gem-selector.app once.

* Alternatively you can lauch a terminal (In the Finder , open the /Applications/Utilities folder, then double-click Terminal) and execute the following:

```sh
./rungems3-mac.sh
```

* For more details about command line parameters, see into `rungems3.sh`. Edit the file `rungems3.sh` (with any simple text editor) in order to ensure that GEMS3 command line parameters point to correct locations of the program resources and of modeling projects.

## Briefly about GEM-Selektor v.3

Distributed "as is" by the Laboratory for Waste Management (LES) of the Paul Scherrer Institute (PSI) with two purposes:

* to promote the GEM method and software into research community;

* to gather the users feedback - vital for making the software more functional and reliable.

Permission to use the GEM-Selektor software is hereby granted free of charge for educational and research purposes, subject to acceptance of Terms and Conditions of Use. In particular, in any publication of your results obtained using the GEM-Selektor code, please, cite the web page (http://gems.web.psi.ch) and the following papers:

* Kulik D.A., Wagner T., Dmytrieva S.V., Kosakowski G., Hingerl F.F., Chudnenko K.V., Berner U. (2013): GEM-Selektor geochemical modeling package: revised algorithm and GEMS3K numerical kernel for coupled simulation codes. Computational Geosciences 17, 1-24.

* Wagner T., Kulik D.A., Hingerl F.F., Dmytrieva S.V. (2012): GEM-Selektor geochemical modeling package: TSolMod library and data interface for multicomponent phase models. Canadian Mineralogist 50, 1173-1195.

DISCLAIMER: thermodynamic data bases in test modeling projects provided in this installation are provisional and undocumented. The Development Team accepts no liability of any kind for any losses or inconveniences that may result from use of the data provided in modeling projects for testing and educational purposes. No guarantee is given that the input data in test projects are, in fact, accurate. 

**Enjoy GEM-Selektor!**

(c) 2003-2025 GEMS Development Team

gems2.support@psi.ch

http://gems.web.psi.ch
 

