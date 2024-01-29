package fpay.net.`in`

import android.app.Activity.RESULT_OK
import android.content.Intent
import com.service.finopayment.Hostnew
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.Date
import com.finopaytech.finosdk.helpers.FinoApplication
import org.json.JSONObject

//import com.paysprint.onboardinglib.activities.HostActivity
//import java.util.Objects

class MainActivity : FlutterActivity() {
    private val MANTRACODE = 1001
    private val MORPHOCODE = 1002
    private val MATMCODE = 1023
    private val ONBOARDCODE = 1024

    lateinit var re: MethodChannel.Result
    private val AEPS_CHANNEL = "aeps"
    private lateinit var channel: MethodChannel
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, AEPS_CHANNEL)

        channel.setMethodCallHandler { call, result ->
            if (call.method == "Register") {
                FinoApplication.init(applicationContext)
                result.success(null);
            } else if (call.method == "AEPSPIDDATA") {
                re = result
                val arguments = call.arguments as Map<String, String>
                val name = arguments["device"]
                if (name == "Mantra") {
                    callMantraDevice()
                } else {
                    callMorphoDevice()
                }
            } else if (call.method == "MATM") {
                re = result
                val arguments = call.arguments as Map<String, String>
                callMAtm(arguments)
            } else if (call.method == "ONBOARD") {
                re = result
                val arguments = call.arguments as Map<String, String>
                matamOnboarding(arguments)
            } else {

            }
        }
    }

    private fun validationOfDevice(): String? {
        return try {
            "<?xml version=\"1.0\"?><PidOptions ver=\"1.0\"><Opts fCount=\"1\" fType=\"2\" iCount=\"0\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" timeout=\"10000\" wadh=\"\" posh=\"UNKNOWN\" env=\"P\" /><CustOpts><Param name=\"mantrakey\" value=\"\" /></CustOpts></PidOptions>"
        } catch (exception: Exception) {
            ""
        }
    }

    private fun callMantraDevice() {
        try {
            val intent2 = Intent()
            intent2.action = "in.gov.uidai.rdservice.fp.CAPTURE"
            intent2.putExtra("PID_OPTIONS", validationOfDevice())
            startActivityForResult(intent2, MANTRACODE)
        } catch (e: Exception) {
            re.success("1 Your mantra device is not connected")
        }
    }

    private fun callMorphoDevice() {
        try {
            val intent2 = Intent("in.gov.uidai.rdservice.fp.CAPTURE")
            intent2.putExtra("PID_OPTIONS", validationOfDevice())
            intent2.setPackage("com.scl.rdservice")
            startActivityForResult(intent2, MORPHOCODE)
        } catch (e: Exception) {
            re.success("1 Your morpho device is not connected")
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == RESULT_OK) {
            if (requestCode == MANTRACODE || requestCode == MORPHOCODE) {
                val b = data?.extras
                if (b != null) {
                    val result = b.getString("PID_DATA")
                    if (result!!.contains("Device not ready")) {
                        re.success("1 Your device is not ready properly !!")
                    }
                    if (result.contains("errCode=\"0\"")) {
                        try {
                            re.success("0 $result")

                        } catch (e: Exception) {
                            e.printStackTrace()
                        }
                    }
                } else {
                    re.success("1 Your device is not ready properly !!")
                }
            } else if (requestCode == MATMCODE) {
                println("coming data ---------- ${data?.getStringExtra("JSONDATA")}")
                val response: MutableMap<String, Any> = HashMap()
                response["status"] = data?.extras?.getBoolean("status")!!
                response["message"] = data.extras?.getString("message")!!
                response["response"] = data.extras?.getInt("response")!!
                response["data"] = data.getStringExtra("JSONDATA").toString()
                re.success(response)
            } else if (requestCode == ONBOARDCODE) {
                val json = JSONObject((data?.getStringExtra("JSONDATA")).toString())
                println("json data ---- $json")
                val status = data?.getBooleanExtra("status", false)
                val response = data?.getIntExtra("response", 0)
                val message = data?.getStringExtra("message")

                println("get data------------------- $status ======= $message")
            }
        }
    }

    private fun callMAtm(data: Map<String, String>) {
        val referenceNo = SimpleDateFormat("yyyyMMddHHmmss").format(Date())

        println("reference Number ---------------- ${referenceNo}")
        val intent = Intent(this, Hostnew::class.java)
        intent.putExtra("partnerId", "PS003111")
        intent.putExtra("apiKey", "UFMwMDMxMTE2NmEwNWMyYjU5MDQwMzk0YjQwYWU2NWEzZjlkYWUzZQ==")
        intent.putExtra("transactionType", data["method"])
        intent.putExtra("amount", data["amount"])
        intent.putExtra("merchantCode", data["merchantCode"])
        intent.putExtra("remarks", "Test Transaction")
        intent.putExtra("mobileNumber", data["mobileNumber"])
        intent.putExtra("referenceNumber", referenceNo)
        intent.putExtra("latitude", "22.572646")
        intent.putExtra("longitude", "88.363895")
        intent.putExtra("subMerchantId", "832960")
        intent.putExtra("deviceManufacturerId", "3")
        startActivityForResult(intent, MATMCODE)
    }

    private fun matamOnboarding(data: Map<String, String>) {
//        val intent = Intent(this, HostActivity::class.java)
//        intent.putExtra("pId", "PS003111")
//        intent.putExtra("pApiKey", "UFMwMDMxMTE2NmEwNWMyYjU5MDQwMzk0YjQwYWU2NWEzZjlkYWUzZQ==")
//        intent.putExtra("mCode", data["mCode"])
//        intent.putExtra("mobile", data["number"])
//        intent.putExtra("lat", "22.572646")
//        intent.putExtra("lng", "88.363895")
//        intent.putExtra("firm", data["firm"])
//        intent.putExtra("email", data["email"])
//        intent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
//        startActivityForResult(intent, ONBOARDCODE)
    }
}
