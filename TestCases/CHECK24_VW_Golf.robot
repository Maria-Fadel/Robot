*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/Locators.py
Resource  ../PageResources/Browser_Open&Close.robot
Resource  ../PageResources/AutoPage.robot
Resource  ../PageResources/StartPage.robot
Resource  ../PageResources/SituationPage.robot
Resource  ../PageResources/NutzungAutoPage.robot
Resource  ../PageResources/VersicherungsnehmerPage.robot
Resource  ../PageResources/AutoFahrer.robot
Resource  ../PageResources/VorversicherungPage.robot
Resource  ../PageResources/SchadenFreiheitsrabattPage.robot
Resource  ../PageResources/RabattPage.robot
Resource  ../PageResources/AngebotsPage.robot


Test Setup  Browser_Open&Close.Open Browser & Maximize
Test Teardown   Browser_Open&Close.TestCase beenden

*** Variables ***


*** Test Cases ***
Überprüfen der grundlegende Suchfunktion für Check25/KFZ
    [documentation]     die Idee von diesem Test ist Robot Framework zu erlernen und zu benutzen.
    [tags]  Automatisierung

    StartPage.Start TestCase

    SituationPage.Neu angeschafftes Auto auswählen
    weiter-Button click

    AutoPage.Radio Button Fahrzeugschein auswählen
    AutoPage.HSN & TSN mit Daten ausfühllen
    AutoPage.Assertion: das gewünschte Auto wurde gefunden
    AutoPage.Erstzulassung des Auto
    AutoPage.Ungefährer Nerwert des Autos
    weiter-Button click

    NutzungAutoPage.Verwendung Nur Privat
    NutzungAutoPage.Jährliche Fahrleistung
    NutzungAutoPage.Nächtlicher Stellplatz: Einzelgarage
    NutzungAutoPage.Finanz des Autos: Barkauf
    weiter-Button click

    VersicherungsnehmerPage.Assertion: Versicherungsnehmer (Sie selbst) ist vorhanden
    VersicherungsnehmerPage.Geschlecht männlich auswählen
    VersicherungsnehmerPage.Geburtsdatum
    VersicherungsnehmerPage.Führerschein Erwerb
    VersicherungsnehmerPage.Familienstand: Verheiratet
    VersicherungsnehmerPage.Beruf: Angesteller
    VersicherungsnehmerPage.PLZ
    VersicherungsnehmerPage.Punkte in Flensburg
    VersicherungsnehmerPage.Zugriff auf weitere Autos
    weiter-Button click

    AutoFahrer.Assertion: Fahrer des Autos ist vorhanden
    AutoFahrer.Fahrer des Autos: Versicherungsnehmer
    weiter-Button click

    VorversicherungPage.Assertion: Vorversichung ist vorhanden
    VorversicherungPage.Schadenfreinheitsrabat ist vorhanden
    Vorversichung bei HUK24
    VorversicherungPage.vorversicherungsDauer: bis zu 2 Jahr
    VorversicherungPage.Kündigung durch Versicherungsnehmer
    weiter-Button click

    SchadenFreiheitsrabattPage.Haftpflicht SF-Klasse
    SchadenFreiheitsrabattPage.Bisher keine Vollkasko
    weiter-Button click

    RabattPage.Assertion: Rabatte ist vorhanden.
    RabattPage.Weiteres Auto auf Sie oder Familienmitglieder versichert
    RabattPage.Ich bestätige
    RabattPage.Ergebnis Anzeigen
    RabattPage.Tarifoption Anzeigen

    AngebotsPage.Send Angebote zu Datenbank


*** Keywords ***



