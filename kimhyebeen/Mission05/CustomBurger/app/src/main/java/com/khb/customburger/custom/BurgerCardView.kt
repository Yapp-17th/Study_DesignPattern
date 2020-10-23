package com.khb.customburger.custom

import android.content.Context
import android.content.res.TypedArray
import android.util.AttributeSet
import android.view.View
import androidx.constraintlayout.widget.ConstraintLayout
import com.khb.customburger.R
import kotlinx.android.synthetic.main.item_burger.view.*

class BurgerCardView: ConstraintLayout {
    private var image: Int = R.drawable.cabbage
    private var text: String = "cabbage"

    constructor(context: Context) : super(context)
    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
        init(context, attrs)
    }
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
        init(context, attrs)
    }
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int, defStyleRes: Int) : super(context, attrs, defStyleAttr, defStyleRes) {
        init(context, attrs)
    }

    private fun init(context: Context, attrs: AttributeSet?) {
        val view: View = View.inflate(context, R.layout.item_burger, this)

        val typeArray: TypedArray = context.theme.obtainStyledAttributes(
                attrs,
                R.styleable.BurgerCardView,
                0, 0
        )

        try {
            image = typeArray.getResourceId(R.styleable.BurgerCardView_materialImage, R.drawable.cabbage)
            text = typeArray.getString(R.styleable.BurgerCardView_materialText).toString()
        } finally {
            typeArray.recycle()
        }

        setView(view)
    }

    private fun setView(view: View) {
        view.materialImageView.setImageResource(image)
        view.materialTextView.text = text
    }
}