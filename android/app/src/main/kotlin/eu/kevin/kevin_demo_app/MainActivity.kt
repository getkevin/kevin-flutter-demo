package eu.kevin.kevin_demo_app

import java.util.*

import androidx.annotation.NonNull
import android.content.Intent
import kotlin.collections.LinkedHashMap

// Flutter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall

// kevin. SDK
import eu.kevin.accounts.KevinAccountsConfiguration
import eu.kevin.accounts.KevinAccountsPlugin
import eu.kevin.accounts.accountsession.AccountSessionActivity
import eu.kevin.accounts.accountsession.AccountSessionContract
import eu.kevin.accounts.accountsession.AccountSessionResult
import eu.kevin.accounts.accountsession.entities.AccountSessionConfiguration
import eu.kevin.core.entities.SessionResult
import eu.kevin.core.enums.KevinCountry
import eu.kevin.core.plugin.Kevin
import eu.kevin.inapppayments.KevinPaymentsConfiguration
import eu.kevin.inapppayments.KevinPaymentsPlugin
import eu.kevin.inapppayments.paymentsession.PaymentSessionActivity
import eu.kevin.inapppayments.paymentsession.PaymentSessionContract
import eu.kevin.inapppayments.paymentsession.PaymentSessionResult
import eu.kevin.inapppayments.paymentsession.entities.PaymentSessionConfiguration
import eu.kevin.inapppayments.paymentsession.enums.PaymentType

class MainActivity: FlutterActivity() {
    private val channel = "eu.kevin.kevin_demo_app/sdkChannel"
    private var flutterResult: Result? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Setup kevin. SDK
        // Setup your custom theme which extends Theme.Kevin.Base
        Kevin.setTheme(R.style.Theme_Kevin_Base)

        // Set optional locale, default is phone locale
        Kevin.setLocale(Locale("en"))

        // Initialize required plugins with your callback urls
        KevinAccountsPlugin.configure(
            KevinAccountsConfiguration.builder()
                .setCallbackUrl("https://redirect.kevin.eu/authorization.html")
                .build()
        )
        KevinPaymentsPlugin.configure(
            KevinPaymentsConfiguration.builder()
                .setCallbackUrl("https://redirect.kevin.eu/payment.html")
                .build()
        )

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            handle(call, result)
        }
    }

    //----------------------------------------------------------------------------

    private fun handle(call: MethodCall, result: Result) {

        when (call.method) {
            "OpenKevinAccountLinking" -> {
                openKevinAccountLinking(call, result)
            }
            "OpenKevinBankPayment" -> {
                openKevinBankPayment(call, result)
            }
            "OpenKevinCardPayment" -> {
                openKevinCardPayment(call, result)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    //----------------------------------------------------------------------------
    // Kevin SDK integration
    //----------------------------------------------------------------------------

    private fun openKevinAccountLinking(call: MethodCall, result: Result) {
        flutterResult = result

        try {
            val state: String? = call.argument("state")

            val accountLinkingConfiguration = AccountSessionConfiguration.Builder(state!!)
                .setPreselectedCountry(KevinCountry.LITHUANIA)
                .build()
            val intent = Intent(this, AccountSessionActivity::class.java)
            intent.putExtra(AccountSessionContract.CONFIGURATION_KEY, accountLinkingConfiguration)
            startActivityForResult(intent, REQUEST_CODE_LINKING)
        } catch (error: Exception) {
            parseError(error)
        }
    }

    private fun openKevinBankPayment(call: MethodCall, result: Result) {
        flutterResult = result

        try {
            val id: String? = call.argument("id")

            val paymentConfiguration = PaymentSessionConfiguration.Builder(id!!)
                .setPaymentType(PaymentType.BANK)
                .setPreselectedCountry(KevinCountry.LITHUANIA)
                .build()

            val intent = Intent(this, PaymentSessionActivity::class.java)
            intent.putExtra(PaymentSessionContract.CONFIGURATION_KEY, paymentConfiguration)
            startActivityForResult(intent, REQUEST_CODE_PAYMENT)
        } catch (error: Exception) {
            parseError(error)
        }
    }

    private fun openKevinCardPayment(call: MethodCall, result: Result) {
        flutterResult = result

        try {
            val id: String? = call.argument("id")

            val paymentConfiguration = PaymentSessionConfiguration.Builder(id!!)
                .setPaymentType(PaymentType.CARD)
                .setPreselectedCountry(KevinCountry.LITHUANIA)
                .build()

            val intent = Intent(this, PaymentSessionActivity::class.java)
            intent.putExtra(PaymentSessionContract.CONFIGURATION_KEY, paymentConfiguration)
            startActivityForResult(intent, REQUEST_CODE_PAYMENT)
        } catch (error: Exception) {
            parseError(error)
        }
    }

    //----------------------------------------------------------------------------
    // Kevin SDK integration
    //----------------------------------------------------------------------------

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        var response = LinkedHashMap<String, Any>()

        if (requestCode == REQUEST_CODE_LINKING && data != null) {
            val result =
                data.getParcelableExtra<SessionResult<AccountSessionResult>>(AccountSessionContract.RESULT_KEY)
            response = handleAccountLinking(result)
        } else if (requestCode == REQUEST_CODE_PAYMENT && data != null) {
            val result =
                data.getParcelableExtra<SessionResult<PaymentSessionResult>>(PaymentSessionContract.RESULT_KEY)
            response = handlePayment(result)
        } else {
            response["isSuccess"] = false
            response["error"] = "Unknown"
        }

        flutterResult?.success(response)
        flutterResult = null
    }

    private fun handleAccountLinking(result: SessionResult<AccountSessionResult>?): LinkedHashMap<String, Any>  {
        val response = LinkedHashMap<String, Any>()

        when (result) {
            is SessionResult.Success -> {
                val bank = LinkedHashMap<String, Any>()
                bank["id"] = result.value.bank.id
                bank["name"] = result.value.bank.name
                bank["officialName"] = result.value.bank.officialName ?: ""
                bank["imageUri"] = result.value.bank.imageUri
                bank["bic"] = result.value.bank.bic ?: ""

                response["isSuccess"] = true
                response["authorizationCode"] = result.value.authorizationCode
                response["bank"] = bank
            }
            is SessionResult.Canceled -> {
                response["isSuccess"] = false
                response["error"] = "Cancelled"
            }
            is SessionResult.Failure -> {
                response["isSuccess"] = false
                response["error"] = "SDK call failed"
            }
        }

        return response
    }

    private fun handlePayment(result: SessionResult<PaymentSessionResult>?): LinkedHashMap<String, Any> {
        val response = LinkedHashMap<String, Any>()

        when (result) {
            is SessionResult.Success -> {
                response["isSuccess"] = true
                response["paymentId"] = result.value.paymentId
            }
            is SessionResult.Canceled -> {
                response["isSuccess"] = false
                response["error"] = "Cancelled"
            }
            is SessionResult.Failure -> {
                response["isSuccess"] = false
                response["error"] = "SDK call failed"
            }
        }

        return response
    }

    //----------------------------------------------------------------------------
    // Companion
    //----------------------------------------------------------------------------

    companion object {
        const val REQUEST_CODE_LINKING = 100
        const val REQUEST_CODE_PAYMENT = 101
    }

    // ------------------------------------------------------------
    // MARK: - Internal
    // ------------------------------------------------------------

    private fun parseError(error: Exception) {
        val response = LinkedHashMap<String, Any>()

        response["isSuccess"] = false
        response["error"] = error.localizedMessage ?: "Unknown"

        flutterResult?.success(response)
        flutterResult = null
    }
}
