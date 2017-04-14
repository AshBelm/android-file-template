<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_pressed="true">
        <shape>
            <solid android:color="#ffdddddd"/>
            <#if backgroundShape>
            <corners android:bottomRightRadius="@dimen/dialog_custom_radius"/>
            </#if>
        </shape>
    </item>
    <item>
        <shape>
            <solid android:color="#00ffffff"/>
            <#if backgroundShape>
            <corners android:bottomLeftRadius="@dimen/dialog_custom_radius"/>
            </#if>
        </shape>
    </item>
</selector>