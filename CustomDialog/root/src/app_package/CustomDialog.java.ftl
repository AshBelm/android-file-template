package ${packageName};

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

/**
 *
 *
 */

public class ${dialogClass} extends Dialog {
    public ${dialogClass}(Context context) {
        super(context);
    }

    public ${dialogClass}(Context context, int themeResId) {
        super(context, themeResId);
    }

    public static class Builder {
        private Param p;

        public Builder(Context context) {
            p=new Param(context);
        }

        public Builder setTitle(String title) {
            p.title = title;
            return this;
        }

        public Builder setMessage(String message) {
            p.message = message;
            return this;
        }

        public Builder setPositiveButton(String text, OnClickListener listener) {
            p.positiveText = text;
            p.positiveListener = listener;
            return this;
        }

        public Builder setNegativeButton(String text, OnClickListener listener) {
            p.negativeText = text;
            p.negativeListener = listener;
            return this;
        }
        public Builder setCancelable(boolean cancel){
            p.cancelable=cancel;
            return this;
        }
        public void setContentView(View view){
            p.contentView=view;
        }
        public Builder setWidth(int width){
            p.width=width;
            return this;
        }
        public Builder setHeight(int height){
            p.height=height;
            return this;
        }
        public Builder setGravity(int gravity){
            p.gravity=gravity;
            return this;
        }
        public Builder setOffset(int x,int y){
            p.x=x;
            p.y=y;
            return this;
        }
        public Builder setAlpha(float alpha){
            p.alpha=alpha;
            return this;
        }

        public ${dialogClass} create(){
            Context context=p.context.get();
            if(context==null){
                return null;
            }
            final ${dialogClass} dialog=new ${dialogClass}(context, R.style.${dialogClass}Theme);
            dialog.setCancelable(p.cancelable);
            dialog.setCanceledOnTouchOutside(true);
            View view= LayoutInflater.from(context).inflate(R.layout.${dialog_class},null);
            dialog.setContentView(view);
            TextView tv_title= (TextView) view.findViewById(R.id.tv_custom_dialog_title);
            TextView tv_msg= (TextView) view.findViewById(R.id.tv_custom_dialog_msg);
            FrameLayout layout_content= (FrameLayout) view.findViewById(R.id.layout_custom_dialog_content);
            Button btn_positive= (Button) view.findViewById(R.id.btn_custom_dialog_positive);
            Button btn_negative= (Button) view.findViewById(R.id.btn_custom_dialog_negative);
            View v_divider_bottom=view.findViewById(R.id.divider_custom_dialog_bottom);
            View v_divider_top=view.findViewById(R.id.divider_custom_dialog_top);
            View v_divider_btn=view.findViewById(R.id.divider_custom_dialog_btn);
            ViewGroup layout_btn= (ViewGroup) view.findViewById(R.id.layout_custom_dialog_btn);
            //标题
            if(p.title==null||p.title.trim().length()==0){
                tv_title.setVisibility(View.GONE);
                v_divider_top.setVisibility(View.GONE);
            }else{
                tv_title.setText(p.title);
            }
            //中间部分
            if(p.message==null||p.message.trim().length()==0){
                layout_content.removeView(tv_msg);
            }else{
                tv_msg.setText(p.message);
            }
            if(p.contentView!=null){
                layout_content.addView(p.contentView);
            }
            //按钮
            if(p.positiveText==null&&p.positiveListener==null&&p.negativeText==null&&p.negativeListener==null){
                //没设置按钮
                layout_btn.setVisibility(View.GONE);
                v_divider_bottom.setVisibility(View.GONE);
            }else{
                if ((p.positiveText != null || p.positiveListener != null) && (p.negativeText != null || p.negativeListener != null)) {
                    //设置了两个按钮
                    buildPositiveButton(dialog, btn_positive);
                    buildNegativeButton(dialog,btn_negative);
                }else{
                    //仅有一个按钮
                    if(p.positiveText!=null|| p.positiveListener!=null){
                        btn_negative.setVisibility(View.GONE);
                        v_divider_btn.setVisibility(View.GONE);
                        buildPositiveButton(dialog,btn_positive);
                        btn_positive.setBackgroundResource(R.drawable.btn_${dialog_class}_single_selector);
                    }
                    if(p.negativeText!=null||p.negativeListener!=null){
                        btn_positive.setVisibility(View.GONE);
                        v_divider_btn.setVisibility(View.GONE);
                        buildNegativeButton(dialog,btn_negative);
                        btn_negative.setBackgroundResource(R.drawable.btn_${dialog_class}_single_selector);
                    }
                }
            }
            //位置大小
            Window dialWindow=dialog.getWindow();
            WindowManager.LayoutParams lp = dialWindow.getAttributes();
            dialWindow.setGravity(p.gravity);
            if(p.width!=0){
                lp.width=p.width;
            }
            if(p.height!=0){
                lp.height=p.height;
            }
            if(p.x!=0){
                lp.x=p.x;
            }
            if(p.y!=0){
                lp.y=p.y;
            }
            lp.alpha=p.alpha;
            dialWindow.setAttributes(lp);
            return dialog;
        }

        private void buildPositiveButton(final ${dialogClass} dialog, Button btn) {
            btn.setText(string(p.positiveText));
            btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if(p.positiveListener!=null){
                        p.positiveListener.onClick(dialog, DialogInterface.BUTTON_POSITIVE);
                    }
                    dialog.dismiss();
                }
            });
        }
        private void buildNegativeButton(final ${dialogClass} dialog, Button btn) {
            btn.setText(string(p.negativeText));
            btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if(p.negativeListener!=null){
                        p.negativeListener.onClick(dialog, DialogInterface.BUTTON_NEGATIVE);
                    }
                    dialog.dismiss();
                }
            });
        }

        private String string(String str){
                    if(str==null||str.trim().length()==0){
                        return "";
                    }else{
                        return str;
                    }
                }
    }

    private static class Param {
        public Param(Context context) {
            this.context = new WeakReference<Context>(context);
        }

        WeakReference<Context> context;
        boolean cancelable=true;
        String title="";
        String message="";
        String positiveText=null;
        Dialog.OnClickListener positiveListener;
        String negativeText=null;
        Dialog.OnClickListener negativeListener;
        View contentView;
        int width;
        int height;
        int gravity=Gravity.CENTER;
        int x,y;
        float alpha=1.0f;

    }
}
