# DependencyInjection_iOS
A strategic project that makes the use of "Dependency Ijection"

## Table of contents

- [Aim of the project](Docs/AimOfTheProject/000_Introduction.md)


## Who we Are

* List the project maintainers and contact info:

    - Khalil Mhelheli
        - SOC Analyst (previous job)
        - Embedded system developer (previous job)
        - iOS Developer (current job)
    
        Gabes, Tunisia
        khalil.mhelheli@gmail.com
    
* website, online documentation
    https://inProgressWith.VaporSwift.com
    
    
* +216 29 545 536

## Prerequistes

The project is a simple Xcode and makes  use of the IMDB APi and use of Appel's framework only, therefore no previous installation on any other frameworks or pakages dependencies is required

* Installation guidance

  The project has been developed using XCode version 13.2.1 targeting iOS 15.2. The project can be just forked or downloaded from Git and built directly.

  The App was mainly developed using iPhone 13 Pro as device reference and tested both on the simulator as well on a (iPhone X) physical device.


## Instructions

  The project is separated into two modules:

        - WatchMovieSwInject: Contains the implementation of the Swinject 

        - WatchMovie: Contains the manuel implementation of Dependecy injection

  Every module has its own building:

        - When running WatchMovieSwInject solution, switch to WatchMovieSwInject scheme.

        - When running WatchMovie solution, switch to WatchMovie scheme.

  The modules are independent of each other:

        - The changes in WatchMovieSwInject will not affect the WatchMovie .
        
        - If you are intesrested in studying the composition with Swinject , have a look at the "AppDelegate" on WatchMovieSwInject.

        - If you are interested in studying the composition with manuel DI of WatchMovie, have a look at the "CompositonRoot" folder on WatchMovie

## Design

       - It is not intended to show a professional design, but a developer should have rudamentary design knowledge 

       I implemented compositionLayout for collectionView on the WatchMovie Module
