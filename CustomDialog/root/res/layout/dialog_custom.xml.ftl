<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@drawable/bg_${dialog_class}"
    android:orientation="vertical"
    android:paddingTop="4dp">

    <TextView
        android:id="@+id/tv_custom_dialog_title"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:padding="8dp"
        android:textColor="@color/custom_dialog_primary"
        android:textSize="18dp" />

    <View
        android:id="@+id/divider_custom_dialog_top"
        android:layout_width="match_parent"
        android:layout_height="1px"
        android:background="@color/custom_dialog_divider" />

    <FrameLayout
        android:id="@+id/layout_custom_dialog_content"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="8dp"
        android:layout_marginRight="8dp">

        <TextView
            android:id="@+id/tv_custom_dialog_msg"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:gravity="center"
            android:minHeight="90dp"
            android:textColor="@color/custom_dialog_minor"
            android:textSize="16dp"
            android:textStyle="bold" />
    </FrameLayout>

    <View
        android:id="@+id/divider_custom_dialog_bottom"
        android:layout_width="match_parent"
        android:layout_height="1px"
        android:background="@color/custom_dialog_divider" />

    <LinearLayout
        android:id="@+id/layout_custom_dialog_btn"
        android:layout_width="match_parent"
        android:layout_height="45dp"
        android:orientation="horizontal">

        <Button
            android:id="@+id/btn_custom_dialog_negative"
            android:layout_width="1dp"
            android:layout_height="match_parent"
            android:layout_weight="1"
            android:background="@drawable/btn_${dialog_class}_left_selector"
            android:textColor="@color/custom_dialog_primary"
            android:textSize="16dp" />

        <View
            android:id="@+id/divider_custom_dialog_btn"
            android:layout_width="1px"
            android:layout_height="match_parent"
            android:background="@color/custom_dialog_divider" />

        <Button
            android:id="@+id/btn_custom_dialog_positive"
            android:layout_width="1dp"
            android:layout_height="match_parent"
            android:layout_weight="1"
            android:background="@drawable/btn_${dialog_class}_right_selector"
            android:textColor="@color/custom_dialog_primary"
            android:textSize="16dp"
            android:textStyle="bold" />
    </LinearLayout>
</LinearLayout>