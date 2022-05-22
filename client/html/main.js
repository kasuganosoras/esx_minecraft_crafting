const locales = {
    "zh-CN": {
        "SELECT_ITEM": "选择放入物品",
        "INPUT_NUM": "选择数量",
        "CRAFT_TABLE": "物品合成台",
        "CRAFT_DESC": "点击左侧方格选择要放入的物品和数量，即可合成对应物品",
        "HAS_LABEL": "拥有："
    },
    "en-US": {
        "SELECT_ITEM": "Select Item",
        "INPUT_NUM": "Input Amount",
        "CRAFT_TABLE": "Crafting Table",
        "CRAFT_DESC": "Click on the left grid to select the item and amount, then click the right grid to craft the item",
        "HAS_LABEL": "You Have: "
    },
}

var entryPoint    = "";
var currentLocale = "zh-CN";

function GetLocale(label) {
    return locales[currentLocale][label] || label + " (missing)";
}

function SetInventory(inventory) {
    $(".list-data").html("");
    
    for(var i = 0; i < inventory.length; i++) {
        var item = inventory[i];
        var hasLabel = GetLocale("HAS_LABEL");
        var listHtml = `<div class="chestitem icon" onclick="PutItem(this)" data-item="${item.name}" title="${item.label}">
            <div class="icon-img" data-toggle="tooltip" data-placement="top" title="${item.label}">
                <img src="items/${item.name}.png" alt="">
            </div>
            <div class="icon-desc">
                <span class="name">${item.label}</span>
                <span class="amount">${hasLabel}${item.amount}</span>
            </div>
        </div>`;
        $(".list-data").append(listHtml);
    }
    $('[data-toggle="tooltip"]').tooltip();
}

function SetChestDisplay(status) {
    if(status) {
        $(".mc-chest").show();
        $(".background").show();
    } else {
        $(".mc-chest").hide();
        $(".background").hide();
    }
}

function SetInventoryDisplay(status) {
    if(status) {
        $(".inventory-list").show();
        $(".background2").show();
    } else {
        $(".inventory-list").hide();
        $(".background2").hide();
    }
}

function PutItem(element) {
    var item = $(element).attr("data-item");
    var label = $(element).attr("title");
    $.post(entryPoint, JSON.stringify({
        action: "putItem",
        item:   item,
        amount: parseInt($("#putItemNum").val()),
        label:  label
    }));
}

function SelectItem(element) {
    var posX = $(element).attr("data-posX");
    var posY = $(element).attr("data-posY");
    $.post(entryPoint, JSON.stringify({
        action: "selectItem",
        posX:   posX,
        posY:   posY
    }));
}

function RemoveItem(element) {
    var item = $(element).attr("data-item");
    var posX = $(element).attr("data-posX");
    var posY = $(element).attr("data-posY");
    $.post(entryPoint, JSON.stringify({
        action: "removeItem",
        item:   item,
        posX:   posX,
        posY:   posY,
    }));
}

function GetItem(element) {
    var item   = $(element).attr("data-item");
    var amount = $(element).attr("data-amount");
    $.post(entryPoint, JSON.stringify({
        action: "getItem",
        item:   item,
        amount: parseInt(amount)
    }));
}

function SetGrid(x, y, item, amount, label) {
    $(`#pos-${x}-${y}`).html(`<img src="items/${item}.png" alt="" onclick="RemoveItem(this)" data-toggle="tooltip" data-placement="top" data-item="${item}" title="${label}">`);
    if(amount > 1) {
        $(`#pos-${x}-${y}-num`).html(amount);
    } else {
        $(`#pos-${x}-${y}-num`).html("");
    }
    $('[data-toggle="tooltip"]').tooltip();
}

function RemoveGrid(x, y) {
    $(`#pos-${x}-${y}`).html("");
    $(`#pos-${x}-${y}-num`).html("");
}

function SetResultGrid(item, amount, label) {
    $("#pos-result").html(`<img src="items/${item}.png" alt="" onclick="GetItem(this)" data-toggle="tooltip" data-placement="top" data-item="${item}" data-amount="${amount}" title="${label}">`);
    if(amount > 1) {
        $("#pos-result-num").html(amount);
    } else {
        $("#pos-result-num").html(amount);
    }
    $('[data-toggle="tooltip"]').tooltip();
}

function RemoveResultGrid() {
    $("#pos-result").html("");
    $("#pos-result-num").html("");
}

function UpdateLocales() {
    var elements = $("*[data-locale!='']");
    for(var i = 0; i < elements.length; i++) {
        var element     = elements[i];
        var localeLabel = $(element).attr("data-locale");
        if(localeLabel != "" && localeLabel != undefined) {
            var lang = $(element).attr("data-locale");
            $(element).html(GetLocale(lang));
        }
    }
}

window.addEventListener("message", function(event) {
    var message = event.data;
    var data    = message.data;
    switch(message.action) {
        case "setChestDisplay":
            SetChestDisplay(data.status);
            break;
        case "setInventory":
            SetInventory(data.inventory);
            break;
        case "setInventoryDisplay":
            SetInventoryDisplay(data.status);
            break;
        case "setGrid":
            SetGrid(data.x, data.y, data.item, data.amount, data.label);
            break;
        case "removeGrid":
            RemoveGrid(data.x, data.y);
            break;
        case "setResultGrid":
            SetResultGrid(data.item, data.amount, data.label);
            break;
        case "removeResultGrid":
            RemoveResultGrid();
            break;
        case "swalAlert":
            Swal.fire(data);
            break;
        case "setLocale":
            currentLocale = data.locale;
            UpdateLocales();
            break;
        case "setEntryPoint":
            entryPoint = data.entryPoint;
            break;
    }
});

window.onload = function() {
    $("body").bind("keydown",function(e) {
        var event = e || window.event;
        var code = event.keyCode || event.which || event.charCode;
        if (code == 34 || code == 27) {
            $.post(entryPoint, JSON.stringify({
                action: "closeUI"
            }));
        }    
    });
}