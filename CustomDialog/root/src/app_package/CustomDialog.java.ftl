package ${packageName};

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

public class ${dialogClass} extends Dialog {
    private DialogViewHolder mView;
    private boolean mButtonCancelable = true;
    protected ${dialogClass}(Context context) {
        this(context, 0);
    }

    protected ${dialogClass}(Context context, int themeResId) {
        super(context, themeResId);
        mView = new DialogViewHolder();
    }

    public Button getPositiveButton() {
        return mView.btn_positive;
    }

    public Button getNegativeButton() {
        return mView.btn_negative;
    }

    public TextView getTitleTextView() {
        return mView.tv_title;
    }

    public TextView getMessageTextView() {
        return mView.tv_msg;
    }

    /**
     * 按钮点击后是否使dialog消失
     * 这个方法仅在按钮点击回调中起作用，并且每次点多需要设置
     * 默认为true
     */
    public void setButtonCancelable(boolean cancelable){
        mButtonCancelable = cancelable;
    }
    public static class Builder {
        private Param p;

        public Builder(Context context) {
            p = new Param(context);
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

        public Builder setCancelable(boolean cancel) {
            p.cancelable = cancel;
            return this;
        }

        public void setContentView(View view) {
            p.contentView = view;
        }

        public Builder setWidth(int width) {
            p.width = width;
            return this;
        }

        public Builder setHeight(int height) {
            p.height = height;
            return this;
        }

        public Builder setGravity(int gravity) {
            p.gravity = gravity;
            return this;
        }

        public Builder setOffset(int x, int y) {
            p.x = x;
            p.y = y;
            return this;
        }

        public Builder setAlpha(float alpha) {
            p.alpha = alpha;
            return this;
        }

        public ${dialogClass} create() {
            Context context = p.context.get();
            if (context == null) {
                return null;
            }
            final ${dialogClass} dialog = new ${dialogClass}(context, R.style.${dialogClass}Theme);
            dialog.setCancelable(p.cancelable);
            if (p.cancelable) {
                dialog.setCanceledOnTouchOutside(true);
            }
            dialog.mView.inflate(context);
            dialog.setContentView(dialog.mView.rootView);
            //标题
            if (p.title == null || p.title.trim().length() == 0) {
                dialog.mView.tv_title.setVisibility(View.GONE);
                dialog.mView.v_divider_top.setVisibility(View.GONE);
            } else {
                dialog.mView.tv_title.setText(p.title);
            }
            //中间部分
            if (p.message == null || p.message.trim().length() == 0) {
                dialog.mView.layout_content.removeView(dialog.mView.tv_msg);
            } else {
                dialog.mView.tv_msg.setText(p.message);
            }
            if (p.contentView != null) {
                dialog.mView.layout_content.addView(p.contentView);
            }
            //按钮
            if (p.positiveText == null && p.positiveListener == null && p.negativeText == null && p.negativeListener == null) {
                //没设置按钮
                dialog.mView.layout_btn.setVisibility(View.GONE);
                dialog.mView.v_divider_bottom.setVisibility(View.GONE);
            } else {
                if ((p.positiveText != null || p.positiveListener != null) && (p.negativeText != null || p.negativeListener != null)) {
                    //设置了两个按钮
                    buildPositiveButton(dialog, dialog.mView.btn_positive);
                    buildNegativeButton(dialog, dialog.mView.btn_negative);
                } else {
                    //仅有一个按钮
                    if (p.positiveText != null || p.positiveListener != null) {
                        dialog.mView.btn_negative.setVisibility(View.GONE);
                        dialog.mView.v_divider_btn.setVisibility(View.GONE);
                        buildPositiveButton(dialog, dialog.mView.btn_positive);
                        dialog.mView.btn_positive.setBackgroundResource(R.drawable.btn_custom_dialog_single_selector);
                    }
                    if (p.negativeText != null || p.negativeListener != null) {
                        dialog.mView.btn_positive.setVisibility(View.GONE);
                        dialog.mView.v_divider_btn.setVisibility(View.GONE);
                        buildNegativeButton(dialog, dialog.mView.btn_negative);
                        dialog.mView.btn_negative.setBackgroundResource(R.drawable.btn_custom_dialog_single_selector);
                    }
                }
            }
            //位置大小
            Window dialWindow = dialog.getWindow();
            WindowManager.LayoutParams lp = dialWindow.getAttributes();
            dialWindow.setGravity(p.gravity);
            if (p.width != 0) {
                lp.width = p.width;
            }
            if (p.height != 0) {
                lp.height = p.height;
            }
            if (p.x != 0) {
                lp.x = p.x;
            }
            if (p.y != 0) {
                lp.y = p.y;
            }
            lp.alpha = p.alpha;
            dialWindow.setAttributes(lp);
            return dialog;
        }

        public ${dialogClass} show() {
            final ${dialogClass} dialog = create();
            dialog.show();
            return dialog;
        }

        private void buildPositiveButton(final ${dialogClass} dialog, Button btn) {
            btn.setText(string(p.positiveText));
            btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.mButtonCancelable = true;
                    if (p.positiveListener != null) {
                        p.positiveListener.onClick(dialog, DialogInterface.BUTTON_POSITIVE);
                    }
                    if(dialog.mButtonCancelable){
                        dialog.dismiss();
                    }
                }
            });
        }

        private void buildNegativeButton(final ${dialogClass} dialog, Button btn) {
            btn.setText(string(p.negativeText));
            btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.mButtonCancelable = true;
                    if (p.negativeListener != null) {
                        p.negativeListener.onClick(dialog, DialogInterface.BUTTON_NEGATIVE);
                    }
                    if(dialog.mButtonCancelable){
                        dialog.dismiss();
                    }
                }
            });
        }

        private String string(String str) {
            if (str == null || str.trim().length() == 0) {
                return "";
            } else {
                return str;
            }
        }
    }

    private class DialogViewHolder {
        private View rootView;
        private TextView tv_title;
        private TextView tv_msg;
        private Button btn_positive;
        private Button btn_negative;
        private FrameLayout layout_content;
        private View v_divider_bottom, v_divider_top, v_divider_btn;
        private ViewGroup layout_btn;

        private void inflate(Context context) {
            View view = LayoutInflater.from(context).inflate(R.layout.${dialog_class}, null);
            rootView = view;
            tv_title = (TextView) view.findViewById(R.id.tv_${dialog_class}_title);
            tv_msg = (TextView) view.findViewById(R.id.tv_${dialog_class}_msg);
            layout_content = (FrameLayout) view.findViewById(R.id.layout_${dialog_class}_content);
            btn_positive = (Button) view.findViewById(R.id.btn_${dialog_class}_positive);
            btn_negative = (Button) view.findViewById(R.id.btn_${dialog_class}_negative);
            v_divider_bottom = view.findViewById(R.id.divider_${dialog_class}_bottom);
            v_divider_top = view.findViewById(R.id.divider_${dialog_class}_top);
            v_divider_btn = view.findViewById(R.id.divider_${dialog_class}_btn);
            layout_btn = (ViewGroup) view.findViewById(R.id.layout_${dialog_class}_btn);
        }
    }

    private static class Param {
        WeakReference<Context> context;
        boolean cancelable = true;
        String title = "";
        String message = "";
        String positiveText = null;
        Dialog.OnClickListener positiveListener;
        String negativeText = null;
        Dialog.OnClickListener negativeListener;
        View contentView;
        int width;
        int height;
        int gravity = Gravity.CENTER;
        int x, y;
        float alpha = 1.0f;

        public Param(Context context) {
            this.context = new WeakReference<Context>(context);
        }
    }
}
