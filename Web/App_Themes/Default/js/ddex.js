var textSeparator = ";";


//------------------------------------------------------Periodo ------------------------------------------------------//

function DropDownHandler(s, e) {
    SynchronizeFocusedNode();
}
function TreeListInitHandler(s, e) {
    SynchronizeFocusedNode();
}

function TreeListNodeClickHandler(s, e) {

    s.GetSelectedNodeValues("IND_ID;NOMBRE_INTERNO", SynchronizeFocusedNode);
}
function SynchronizeFocusedNode(values) {

    if (values != null) {
        var text = "";
        for (var val in values) {
            text = text + values[val][1] + textSeparator;

        }
        checkComboBoxPer.SetText(text);
    }
}

//------------------------------------------------------Oficina ------------------------------------------------------//
function OnListBoxSelectionChangedOfi(listBox, args) {
    if (args.index == 0)
        args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
    UpdateSelectAllItemStateOfi();
    UpdateTextOfi();
}
function UpdateSelectAllItemStateOfi() {
    IsAllSelectedOfi() ? checkListBoxOfi.SelectIndices([0]) : checkListBoxOfi.UnselectIndices([0]);
}
function IsAllSelectedOfi() {
    var selectedDataItemCount = checkListBoxOfi.GetItemCount() - (checkListBoxOfi.GetItem(0).selected ? 0 : 1);
    return checkListBoxOfi.GetSelectedItems().length == selectedDataItemCount;
}
function UpdateTextOfi() {
    var selectedItems = checkListBoxOfi.GetSelectedItems();
    checkComboBoxOfi.SetText(GetSelectedItemsTextOfi(selectedItems));
}
function SynchronizeListBoxValuesOfi(dropDown, args) {
    checkListBoxOfi.UnselectAll();
    var texts = dropDown.GetText().split(textSeparator);
    var values = GetValuesByTextsOfi(texts);
    checkListBoxOfi.SelectValues(values);
    UpdateSelectAllItemStateOfi();
    UpdateTextOfi(); // for remove non-existing texts
}
function GetSelectedItemsTextOfi(items) {
    var texts = [];
    for (var i = 0; i < items.length; i++)
        if (items[i].index != 0)
            texts.push(items[i].text);
    return texts.join(textSeparator);
}
function GetValuesByTextsOfi(texts) {
    var actualValues = [];
    var item;
    for (var i = 0; i < texts.length; i++) {
        item = checkListBoxOfi.FindItemByText(texts[i]);
        if (item != null)
            actualValues.push(item.value);
    }
    return actualValues;
}



//------------------------------------------------------Grupo ------------------------------------------------------//
function OnListBoxSelectionChangedGpo(listBox, args) {
    if (args.index == 0)
        args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
    UpdateSelectAllItemStateGpo();
    UpdateTextGpo();
}
function UpdateSelectAllItemStateGpo() {
    IsAllSelectedGpo() ? checkListBoxGpo.SelectIndices([0]) : checkListBoxGpo.UnselectIndices([0]);
}
function IsAllSelectedGpo() {
    var selectedDataItemCount = checkListBoxGpo.GetItemCount() - (checkListBoxGpo.GetItem(0).selected ? 0 : 1);
    return checkListBoxGpo.GetSelectedItems().length == selectedDataItemCount;
}
function UpdateTextGpo() {
    var selectedItems = checkListBoxGpo.GetSelectedItems();
    checkComboBoxGpo.SetText(GetSelectedItemsTextGpo(selectedItems));
}
function SynchronizeListBoxValuesGpo(dropDown, args) {
    checkListBoxGpo.UnselectAll();
    var texts = dropDown.GetText().split(textSeparator);
    var values = GetValuesByTextsGpo(texts);
    checkListBoxGpo.SelectValues(values);
    UpdateSelectAllItemStateGpo();
    UpdateTextGpo(); // for remove non-existing texts
}
function GetSelectedItemsTextGpo(items) {
    var texts = [];
    for (var i = 0; i < items.length; i++)
        if (items[i].index != 0)
            texts.push(items[i].text);
    return texts.join(textSeparator);
}
function GetValuesByTextsGpo(texts) {
    var actualValues = [];
    var item;
    for (var i = 0; i < texts.length; i++) {
        item = checkListBoxGpo.FindItemByText(texts[i]);
        if (item != null)
            actualValues.push(item.value);
    }
    return actualValues;
}


//------------------------------------------------------Segmento ------------------------------------------------------//
function OnListBoxSelectionChangedSeg(listBox, args) {
    if (args.index == 0)
        args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
    UpdateSelectAllItemStateSeg();
    UpdateTextSeg();
}
function UpdateSelectAllItemStateSeg() {
    IsAllSelectedSeg() ? checkListBoxSeg.SelectIndices([0]) : checkListBoxSeg.UnselectIndices([0]);
}
function IsAllSelectedSeg() {
    var selectedDataItemCount = checkListBoxSeg.GetItemCount() - (checkListBoxSeg.GetItem(0).selected ? 0 : 1);
    return checkListBoxSeg.GetSelectedItems().length == selectedDataItemCount;
}
function UpdateTextSeg() {
    var selectedItems = checkListBoxSeg.GetSelectedItems();
    checkComboBoxSeg.SetText(GetSelectedItemsTextSeg(selectedItems));
}
function SynchronizeListBoxValuesSeg(dropDown, args) {
    checkListBoxSeg.UnselectAll();
    var texts = dropDown.GetText().split(textSeparator);
    var values = GetValuesByTextsSeg(texts);
    checkListBoxSeg.SelectValues(values);
    UpdateSelectAllItemStateSeg();
    UpdateTextSeg(); // for remove non-existing texts
}
function GetSelectedItemsTextSeg(items) {
    var texts = [];
    for (var i = 0; i < items.length; i++)
        if (items[i].index != 0)
            texts.push(items[i].text);
    return texts.join(textSeparator);
}
function GetValuesByTextsSeg(texts) {
    var actualValues = [];
    var item;
    for (var i = 0; i < texts.length; i++) {
        item = checkListBoxSeg.FindItemByText(texts[i]);
        if (item != null)
            actualValues.push(item.value);
    }
    return actualValues;
}

//------------------------------------------------------Franja ------------------------------------------------------//
function OnListBoxSelectionChanged(listBox, args) {
    if (args.index == 0)
        args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
    UpdateSelectAllItemState();
    UpdateText();
}

function UpdateSelectAllItemState() {
    IsAllSelected() ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
}
function IsAllSelected() {
    var selectedDataItemCount = checkListBox.GetItemCount() - (checkListBox.GetItem(0).selected ? 0 : 1);
    return checkListBox.GetSelectedItems().length == selectedDataItemCount;
}
function UpdateText() {
    var selectedItems = checkListBox.GetSelectedItems();
    checkComboBox.SetText(GetSelectedItemsText(selectedItems));
}
function SynchronizeListBoxValues(dropDown, args) {
    checkListBox.UnselectAll();
    var texts = dropDown.GetText().split(textSeparator);
    var values = GetValuesByTexts(texts);
    checkListBox.SelectValues(values);
    UpdateSelectAllItemState();
    UpdateText(); // for remove non-existing texts
}
function GetSelectedItemsText(items) {
    var texts = [];
    for (var i = 0; i < items.length; i++)
        if (items[i].index != 0)
            texts.push(items[i].text);
    return texts.join(textSeparator);
}
function GetValuesByTexts(texts) {
    var actualValues = [];
    var item;
    for (var i = 0; i < texts.length; i++) {
        item = checkListBox.FindItemByText(texts[i]);
        if (item != null)
            actualValues.push(item.value);
    }
    return actualValues;
}
