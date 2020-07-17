package com.rnduoyuad;

import android.app.Activity;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;

import com.bun.miitmdid.core.JLibrary;
import com.duoyou.ad.openapi.DyAdApi;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RnDuoYuAdModule extends ReactContextBaseJavaModule {

    public static final String REACT_CLASS = "RnDuoYuAdModule";

    private static String Tag = "RnDuoYuAdModule";
    private static ReactApplicationContext mReactContext;


    public RnDuoYuAdModule(ReactApplicationContext reactContext) {
        super(reactContext);
        mReactContext = reactContext;
    }


    /**
     * 初始化
     * @param activity
     * @param appId
     * @param secretKey
     */
    public static void initialSetting(final Activity activity, final String appId, final String secretKey) {
        Log.e(Tag, appId + secretKey);

        DyAdApi.getDyAdApi().init(appId, secretKey);

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                JLibrary.InitEntry(activity);
                MiitHelper miitHelper = new MiitHelper(new MiitHelper.AppIdsUpdater() {
                    @Override
                    public void OnIdsAvalid(@NonNull String oaid) {
                        Log.i("json", "oaid = " + oaid);
                        DyAdApi.getDyAdApi().setOAID(activity, oaid);
                    }
                });
                Log.i("json", "oaid = 获取OAID");
                miitHelper.getDeviceIds(activity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getName() {
        return REACT_CLASS;
    }

    /**
     * 进入游戏列表
     * @param uid 用户uid
     * @param advertType 0（默认值）显示全部数据  1.手游  2.棋牌游戏
     * @param callback 回调方法
     */
    @ReactMethod
    public void entryGameList(final String uid, final Integer advertType, final Callback callback) {
        Log.e(Tag, "uid = " + uid + ", advertType = " + advertType);
        DyAdApi.getDyAdApi().jumpAdList(mReactContext, uid, advertType);
        callback.invoke("Jump game list successful!");
    }
}