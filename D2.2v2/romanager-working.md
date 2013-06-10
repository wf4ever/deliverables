# Research Object Manager

The Research Object Manager (RO Manager) is a command line tool for creating, displaying and manipulating Research Objects. The RO Manager is complementary to RODL (@@x-ref/check), in that it is primarily designed to support a user working with ROs in the host computer’s local file system, with the intention being that the RODL and RO Manager can exchange ROs between them, using of the shared RO model and vocabularies.  The RO Manager code base also includes the checklist evaluation functionality, described in D4.2 (@@ref), which can be invoked using a command line or REST web interface.

Experience has shown that a simple command-line tool can provide developers and users with early access to to functionality, and provide an opportunity to gather additional user feedback and requirements.  RO Manager has also been used in conjunction with built-in operating system functionality for scripting prototype tool chains for more complex operations involving Research Objects.

The RO Manager allows users and developers to:

* Create local ROs;
* Add resources to an RO;
* Add annotations to an RO;
* Read and write ROs to the RODL;
* Perform checklist evaluation of an RO;
* Obtain a raw dump of Research Object metadata.

An RO user guide is provided at [http://wf4ever.github.io/ro-manager/doc/RO-manager.html]().  An FAQ describing how to deal with various common operations using RO Manager is at [http://www.wf4ever-project.org/wiki/display/docs/RO+Manager+FAQ]().


## Implementation

RO Manager is implemented in Python, and is available as an installable package through the Python Package Index (PyPI) at [https://pypi.python.org/pypi/ro-manager]().

The source code is maintained in the Github project at [https://github.com/wf4ever/ro-manager]().


## Interactions

Interactions between a user, RO Manager and the host file system substantially this pattern:

![RO Manager sequence diagram](Figures/RO_Manager_seq.png "RO Manager sequence diagram")

Figure 21 shows interactions for three typical RO Manager operations, `ro create`, `ro add` and
`ro annotate`, which exemplify typical local RO management operations. The four interacting elements presented are the user-issued command ("/user"), the RO Manager program ("/RO\_Manager"), an internal RO metadata object ("/ro\_metadata") that manages the RO aggregation and annotation metadata, and the local file system ("/file\_system") where ROs are persistently stored and managed.

From this, it can be seen that:

* The `ro create` command initializes an RO structure by interacting directly with the file system.

* The "ro add" command uses the RO URI to initialize an `ro\_metadata` object, and calls its `addAggregatedResources()` method to incorporate one or more files into the RO aggregation. The `ro\_metadata` object updates the RO metadata structures in the file system through a series or read and write operations.

* The "ro annotate" command similarly uses the RO URI to initialize an `ro\_metadata` object, and reads the existing annotations from disk. New annotations may be supplied as an attribute/value or attribute/link pair in which a case a new annotation graph is created in the file system. Otherwise the new annotation may already exist as a graph. In either case, the local copy of the RO manifest is updated to record the new annotation. The annotation may be applied to multiple resources in the RO. Eventually, the updated manifest is written to the file system by the `ro\_metadata` object.


### Source code organization:

The code base that implements the RO Manager command line tool also implements the checklist evaluation service, which is covered in D4.2 (@@ref)

* `Checklists/` - contains working data files used to develop and test checklist functionality
* `Minim/` - contains the OWL ontology descriptions of the Minim models used to describe a checklist to be evaluated by the evaluation service, and the results returned.  These are described further in D4.2 (@@ref)
  * `doc/` - contains files for the RO Manager usage documentation
  * `src/` - umbrella directory for the source code for RO Manager and the checklist evaluation service.  Also contains the script used to create and share an installable package for the RO Manager tool.
    * `MiscLib/` - generic support functions
      * test - unit tests
    * `iaeval/` - checklist evaluation functions, used by command line tool and evaluation web service.
      * `test/` - unit tests
    * `rocommand/` - the main RO Manager command line tool, and also libraries used to access ROs by both the command line tool and the evaluation web service
      * `test/` - unit tests, including a master test suite, TestAll.py, used for checking code prior to release.
    * `roweb/` - the checklist evaluation web service, and traffic light display: this is mainly a web front end to functionality implemented by modules in `rocommand` and `roweb`.
      * `css/` - css and related files used by the web service
      * `images/` - image files used by the web service
      * `samples/` - miscellaneous sample and work-in-progress files, not part of the working software
      * `test/` - unit tests
    * `samples/` - miscellaneous sample and work-in-progress files, not part of the working software
    * `spike/` - code experiments, not part of working software
    * `uritemplate/` - working copy of URI template expansion code from http://code.google.com/p/uri-templates/ (the package has since been distributed via PyPI, so this local working copy should no longer be needed).


### Key modules

Key modules that drive the execution of RO manager and the RO web services are:

* `src/ro` - a wrapper script to run the RO Manager command.
* `src/setup.py` - Python package creation and installation script.
* `src/rocommand/ro.py` - main command line interface for RO Manager, and command dispatcher.  Can be used directly, or invoked via `src/ro`.
* `src/rocommand/ro_command.py` - functions to perform each of the RO Manager commands.
* `src/rocommand/ro_manifest.py` - this is the key interface between RO Manager and the RO being constructed or examined.  Some access-only RO Manager commands can be performed against remote ROs (e.g. in RODL), and logic to detect and handle access to such remote ROs is included here.  This module provides the main internal API between application code and the RO, and as such provides a degree of isolation.
* `src/rocommand/ro_manifest.py` - functions for accessing and manipulating an RO manifest in a local file store.
* `src/rocommand/ro_annotation.py` - functions for creating, accessing and manipulating RO annotations in a local file store.
* `src/rocommand/ROSRS_Session.py` - implements the RO API for accessing ROs in RODL (and possibly elsewhere).
* `src/roweb/rowebservices.py` - web interface for checklist evaluation and "traffic-light" display functions.
* `src/iaeval/ro_eval_minim.py` - checklist evaluation function (cf. `evaluate`)
* `src/iaeval/ro_minim.py` - Minim checklist definition access and parsing.


### Dependencies

The RO Manager is very heavily dependent on [RDFLib](https://github.com/RDFLib), which provides RDF parsing, formatting and SPARQL Query capabilities.

The RO Web service uses the [Pyramid](http://docs.pylonsproject.org/projects/pyramid/) web framework, and [uritemplate](http://code.google.com/p/uri-templates/) for [RFC 6570](http://tools.ietf.org/html/rfc6570) template expansion.



