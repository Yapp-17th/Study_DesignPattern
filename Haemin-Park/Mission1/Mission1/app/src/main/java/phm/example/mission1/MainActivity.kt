package phm.example.mission1

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    var num: Int = 0
    var oderList: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        cbtn.setOnClickListener {

            order.visibility = View.VISIBLE
            obtn.visibility = View.VISIBLE

            order.setText("")

            num++

            val customer: Customer = Customer(num)
            val menu: Menu = Menu

            cnum.text = customer.num.toString()

            obtn.setOnClickListener {

                val barista = Barista()
                val coffee: Coffee? = customer.order(order.text.toString(), menu, barista)

                if (coffee != null) {
                    oderList += "손님("+customer.num.toString() + ")님 주문 접수 완료!"+"\n"
                } else {
                    oderList += "손님("+customer.num.toString() + ")님 주문 접수 실패!"+"\n"
                }
                corder.text = oderList
                order.setText("")
            }
        }
    }
}
