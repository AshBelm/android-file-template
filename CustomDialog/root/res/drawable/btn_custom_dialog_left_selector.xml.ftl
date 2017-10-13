<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_pressed="true">
        <shape>
            <solid android:color="@color/${dialog_class}_pressed" />
            <#if backgroundShape>
            <corners android:bottomLeftRadius="@dimen/${dialog_class}_radius" />
            </#if>
        </shape>
    </item>
    <item>
        <shape>
            <solid android:color="@color/${dialog_class}_transparent" />
            <#if backgroundShape>
            <corners android:bottomLeftRadius="@dimen/${dialog_class}_radius" />
            </#if>
        </shape>
    </item>
</selector>