<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@drawable/bg_${dialog_class}"
    android:orientation="vertical"
    <#if frame>
    android:padding="@dimen/${dialog_class}_frame_width"
    </#if>
    >

    <TextView
        android:id="@+id/tv_${dialog_class}_title"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:padding="@dimen/${dialog_class}_edge"
        android:textColor="@color/${dialog_class}_primary"
        android:textSize="@dimen/${dialog_class}_text_major" />

    <View
        android:id="@+id/divider_${dialog_class}_top"
        android:layout_width="match_parent"
        android:layout_height="@dimen/${dialog_class}_divider"
        android:background="@color/${dialog_class}_line" />

    <FrameLayout
        android:id="@+id/layout_${dialog_class}_content"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="@dimen/${dialog_class}_edge"
        android:layout_marginRight="@dimen/${dialog_class}_edge">

        <TextView
            android:id="@+id/tv_${dialog_class}_msg"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:gravity="center"
            android:minHeight="@dimen/${dialog_class}_content_min_height"
            android:textColor="@color/${dialog_class}_minor"
            android:textSize="@dimen/${dialog_class}_text_minor"
            android:textStyle="bold" />
    </FrameLayout>

    <View
        android:id="@+id/divider_${dialog_class}_bottom"
        android:layout_width="match_parent"
        android:layout_height="@dimen/${dialog_class}_divider"
        android:background="@color/${dialog_class}_line" />

    <LinearLayout
        android:id="@+id/layout_${dialog_class}_btn"
        android:layout_width="match_parent"
        android:layout_height="@dimen/${dialog_class}_button_height"
        android:orientation="horizontal">

        <Button
            android:id="@+id/btn_${dialog_class}_negative"
            android:layout_width="0dp"
            android:layout_height="match_parent"
            android:layout_weight="1"
            android:background="@drawable/btn_${dialog_class}_left_selector"
            android:textColor="@color/${dialog_class}_primary"
            android:textSize="@dimen/${dialog_class}_text_minor" />

        <View
            android:id="@+id/divider_${dialog_class}_btn"
            android:layout_width="@dimen/${dialog_class}_divider"
            android:layout_height="match_parent"
            android:background="@color/${dialog_class}_line" />

        <Button
            android:id="@+id/btn_${dialog_class}_positive"
            android:layout_width="0dp"
            android:layout_height="match_parent"
            android:layout_weight="1"
            android:background="@drawable/btn_${dialog_class}_right_selector"
            android:textColor="@color/${dialog_class}_primary"
            android:textSize="@dimen/${dialog_class}_text_minor"
            android:textStyle="bold" />
    </LinearLayout>
</LinearLayout>