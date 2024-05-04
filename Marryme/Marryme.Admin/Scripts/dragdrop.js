$(document).ready(function () {
    setTimeout(function () {
        $('.box-item').draggable({
            cursor: 'move',
            helper: "clone"
        });

        $("#container1-Registration").droppable({
            drop: function (event, ui) {
                var itemid = $(event.originalEvent.toElement).attr("item-id");
                console.log(itemid);
                $('.box-item').each(function () {
                    if ($(this).attr("item-id") === itemid) {
                        $(this).appendTo("#container1-Registration");
                    }
                });
            }
        });

        $("#container2-Registration").droppable({
            drop: function (event, ui) {
                var itemid = $(event.originalEvent.toElement).attr("item-id");
                console.log(itemid);
                $('.box-item').each(function () {
                    if ($(this).attr("item-id") === itemid) {
                        $(this).appendTo("#container2-Registration");
                    }
                });
            }
        });

        $("#SaveAppearance").click(function () {
            $("#container2-Registration .box-item").each(function () {
                console.log($(this).attr("item-id"));
            });

        });
    }, 2000);


 

});