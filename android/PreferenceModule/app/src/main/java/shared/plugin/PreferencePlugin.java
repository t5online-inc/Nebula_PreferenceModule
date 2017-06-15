package shared.plugin;

import com.t5online.nebulacore.Nebula;
import com.t5online.nebulacore.plugin.Plugin;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by JoAmS on 2017. 6. 15..
 */

public class PreferencePlugin extends Plugin {

    public void get(String key, String defaultValue) {
        String ret = "";
        try {
            ret = Nebula.getPreferenceService().getPreference(key, defaultValue);
            JSONObject object1 = new JSONObject();
            object1.put("value", ret);
            resolve(object1);
        } catch (JSONException e) {
            e.printStackTrace();
            reject();
        }
    }

    public void set(String key, String value) {
        Nebula.getPreferenceService().setPreference(key, value);
        resolve();
    }

    public void remove(String key) {
        Nebula.getPreferenceService().removePreference(key);
        resolve();
    }

    public void removeAll() {
        Nebula.getPreferenceService().removeAllPreference();
        resolve();
    }
}
