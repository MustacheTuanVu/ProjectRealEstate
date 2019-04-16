

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CalendarView — JavaScript Calendar Widget</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

        <link rel="stylesheet" href="calendarview.css">
        <style>
            body {
                font-family: Trebuchet MS;
            }
            div.calendar {
                max-width: 240px;
                margin-left: auto;
                margin-right: auto;
            }
            div.calendar table {
                width: 100%;
            }
            div.dateField {
                width: 140px;
                padding: 6px;
                -webkit-border-radius: 6px;
                -moz-border-radius: 6px;
                color: #555;
                background-color: white;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            div#popupDateField:hover {
                background-color: #cde;
                cursor: pointer;
            }
        </style>
        <script src="prototype.js"></script>
        <script src="calendarview.js"></script>

        <script>
            function setupCalendars() {
                // Embedded Calendar
                Calendar.setup(
                        {
                            dateField: 'embeddedDateField',
                            parentElement: 'embeddedCalendar'
                        }
                )

                // Popup Calendar
                Calendar.setup(
                        {
                            dateField: 'popupDateField',
                            triggerElement: 'popupDateField'
                        }
                )
            }

            Event.observe(window, 'load', function () {
                setupCalendars()
            })
        </script>
    </head>
    <body>

        <div style="float: left; width: 50%">
            <div style="height: 400px; background-color: #efefef; padding: 10px; -webkit-border-radius: 12px; -moz-border-radius: 12px; margin-right: 10px">
                <h3 style="text-align: center; background-color: white; -webkit-border-radius: 10px; -moz-border-radius: 10px; margin-top: 0px; margin-bottom: 20px; padding: 8px">
                    Embedded Calendar
                </h3>

                <div id="embeddedExample" style="">
                    <div id="embeddedCalendar" style="margin-left: auto; margin-right: auto" >
                    </div>
                    <br />
                    <div id="embeddedDateField" class="dateField"  onchange="setDate()">

                        Select Date
                    </div>
                    <p  id="txtHint" ></p>
                    <br />
                </div>

            </div>
        </div>
        <div style="float: right; width: 50%">
            <div style="height: 400px; background-color: #efefef; padding: 10px; -webkit-border-radius: 12px; -moz-border-radius: 12px; margin-left: 10px">
                <h3 style="text-align: center; background-color: white; -webkit-border-radius: 10px; -moz-border-radius: 10px; margin-top: 0px; margin-bottom: 20px; padding: 8px">
                    Popup Calendar
                </h3>
                <div id="popupExample">
                    <div id="popupDateField" class="dateField" style="margin-top: 160px">
                        Show Calendar
                    </div>
                </div>
            </div>
        </div>

        <script>
            function setDate() {
                var a = document.getElementById('embeddedDateField').innerHTML;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("txtHint").innerHTML = this.responseText;
                       // myFunction(this);
                       console.log(this.responseText);
                    }
                };
                xhttp.open("GET", "fetch.jsp?d=" + a, true);
                xhttp.send();
            }

            // create table with xml
//            function myFunction(xml) {
//                var i;
//                var xmlDoc = xml.responseXML;
//                var table = "<tr><th>Artist</th><th>Title</th></tr>";
//                var x = xmlDoc.getElementsByTagName("assign");
//                for (i = 0; i < x.length; i++) {
//                    table += "<tr><td>" +
//                            x[i].getElementsByTagName("firstname")[0].childNodes[0].nodeValue +
//                            "</td></tr>";
//                }
//                document.getElementById("txtHint").innerHTML = table;
//            }

        </script>

    </body>
</html>
