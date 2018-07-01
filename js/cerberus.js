var table_index = new Array(); // Single array holding general info about the tokens data
var table_data = new Array(); // multiarray holding keyframes x tokens
var count = 0;

// Tokens globals
var token_selected = false;
var token_id = 0;
var token_url = "";

// keyframe globals
var current_keyframe = 1;
var first_keyframe = 1;
var keyframe_count = 2;

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

            AddToken(x + "px", y + "px", 0);
        }
    });

    SetKeyframe(first_keyframe);
});

function SetKeyframe(keyframe) {
    // Clear all keyframe glows
    for (var i = 1; i <= keyframe_count; ++i) {
        $(".keyframe[keyframe=" + i + "]").removeClass("selected_kf");
    }
    
    current_keyframe = keyframe;
    $(".keyframe[keyframe=" + current_keyframe + "]").addClass("selected_kf");
    Draw(current_keyframe);
}

function ALERT(text) {
    // just to show errors
    $("#alert").html($("#alert").html() + "<br>" + text);
}

function SelectToken(image, id) {
    $('*').css('cursor', 'url(img/' + image + '), auto');
    token_selected = true;
    token_id = id;
    token_url = "img/" + image;
}

function AddToken(x, y) {
    table_index[count] = { id: token_id, name: "" }

    table_data[count] = new Array();

    // Add the token on every keyframe
    for (var i = 1; i <= keyframe_count; ++i) {
        table_data[count][i] = { x: x, y: y }
    }
    
    $("#canvas").append("<img class='token' token='" + count + "' src='" + token_url + "' style='position: absolute'>");
    $(".token[token=" + count + "]").draggable({
        stop: function (event, ui) {
            UpdateToken($(this).attr("token"), ui.position.left, ui.position.top);
        }
    });

    ++count;

    Draw(current_keyframe);

    return false;
}

function UpdateToken(token_id, x, y) {
    table_data[token_id][current_keyframe] = { x: x, y: y }
}

function Draw(frame) {
    for (var i = 0; i < count; ++i) {
        $(".token[token=" +i+ "]").css({
            left: table_data[i][frame].x,
            top: table_data[i][frame].y
        });
    }
}

function Run() {
    // Set all tokens to frame 1
    Draw(first_keyframe);

    var next_keyframe = first_keyframe + 1;

    for (var i = 0; i < count; ++i) {
        $(".token[token=" + i + "]").animate({
            left: table_data[i][next_keyframe].x,
            top: table_data[i][next_keyframe].y
        }, 2000, function () { });
    }
}