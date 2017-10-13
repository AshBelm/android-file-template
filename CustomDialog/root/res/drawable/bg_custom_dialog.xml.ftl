<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android">
    <solid android:color="@color/${dialog_class}_background" />
    <#if backgroundShape>
    <corners android:radius="@dimen/${dialog_class}_radius"/>
    </#if>
    <stroke android:width="@dimen/${dialog_class}_frame_width" android:color="@color/${dialog_class}_line"/>
</shape>
