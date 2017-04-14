<?xml version="1.0"?>
<recipe>
    <merge from="root/res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
    <merge from="root/res/values/dimens.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    <merge from="root/res/values/styles.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
    <instantiate from="root/res/drawable/bg_custom_dialog.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/drawable/bg_${dialog_class}.xml" />
     <instantiate from="root/res/drawable/btn_custom_dialog_left_selector.xml.ftl"
                     to="${escapeXmlAttribute(resOut)}/drawable/btn_${dialog_class}_left_selector.xml" />
    <instantiate from="root/res/drawable/btn_custom_dialog_right_selector.xml.ftl"
                     to="${escapeXmlAttribute(resOut)}/drawable/btn_${dialog_class}_right_selector.xml" />
     <instantiate from="root/res/drawable/btn_custom_dialog_single_selector.xml.ftl"
                          to="${escapeXmlAttribute(resOut)}/drawable/btn_${dialog_class}_single_selector.xml" />
    <instantiate from="root/res/layout/dialog_custom.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${dialog_class}.xml" />

    <instantiate from="root/src/app_package/CustomDialog.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${dialogClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${dialogClass}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${dialog_class}.xml" />
</recipe>
