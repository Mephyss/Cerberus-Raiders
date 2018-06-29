var table_index = new Array(); // Single array holding general info about the tokens data
var table_data = new Array(); // multiarray holding keyframes x tokens
var count = 0;

var token_selected = false;
var token_id = 0;

$(document).ready(function () {
    $("#canvas").css("background", "url(img/antorus-argus.png) no-repeat");
    /*
    $(document).on("contextmenu", function (e) {
        if (e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA")
            e.preventDefault();
    });
    */

    $(document).mousedown(function (e) {
        if (e.button == 2) {
            if (token_selected) {
                $('*').css('cursor', 'default');
                token_selected = false;
            }
        }
    });

    $("#canvas").click(function (e) {
        if (token_selected) {
            $('*').css('cursor', 'default');
            token_selected = false;

            var posX = $("#canvas").position().left;
            var posY = $("#canvas").position().top;

            var x = e.pageX - posX;
            var y = e.pageY - posY;

            AddToken(1, "", x + "px", y + "px", 0);
        }
    });


});

function ALERT(text) {
    $("#alert").html($("#alert").html() + "<br>" + text);
}

function SelectToken(image, id) {
    $('*').css('cursor', 'url(img/' + image + '), auto');
    token_selected = true;
    token_id = id;
}

function AddToken(id, name, x, y, frame) {
    table_index[count] = { id: id, name: name }

    table_data[count] = new Array();
    table_data[count][frame] = { x: x, y: y }

    $("#canvas").append("<img class='token' token='" + count + "' src='img/protectionwarrior.png' style='position: absolute'>");
    $(".token[token=" + count + "]").draggable();

    ++count;

    Draw();

    return false;
}

function Draw() {
    for (var i = 0; i < count; ++i) {
        $(".token[token=" +i+ "]").css({
            left: table_data[i][0].x,
            top: table_data[i][0].y
        });
    }
}

function Run() {
    // Set all tokens to frame 1
    for (var i = 0; i < count; ++i) {
        $(".token[token=" + i + "]").css({
            left: table_data[i][0].x,
            top: table_data[i][0].y
        });
    }

    for (var i = 0; i < count; ++i) {
        $(".token[token=" + i + "]").animate({
            left: table_data[i][1].x,
            top: table_data[i][1].y
        }, 2000, function () { });
    }
}