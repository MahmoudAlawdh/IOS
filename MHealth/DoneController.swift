//
//  DoneController.swift
//  MHealth
//
//  Created by trn1 on 3/7/17.
//  Copyright © 2017 PIFSS. All rights reserved.
//

import UIKit

class DoneController: UIViewController {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    
    
    
    
    @IBOutlet var can2: UITextView!
    @IBOutlet var can1: UITextView!
    @IBOutlet var After7: UITextView!
    @IBOutlet var After6: UITextView!
    @IBOutlet var After5: UITextView!
    @IBOutlet var After4: UITextView!
    @IBOutlet var After3: UITextView!
    @IBOutlet var After2: UITextView!
    @IBOutlet var After1: UITextView!
    @IBOutlet var before3: UITextView!
    @IBOutlet var before2: UITextView!
    @IBOutlet var before1: UITextView!
    @IBOutlet var Procee3: UITextView!
    @IBOutlet var Procee2: UITextView!
    @IBOutlet var Procee1: UITextView!
    @IBAction func Done(sender: AnyObject) {
                self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let langu:String = userDefaults.valueForKey("lang") as! String
        
        
        if langu == "ar" {
            Procee1.text = " كم من الوقت تستغرق؟1-التبرع بالدم: يستغرق حوالي 10 دقيقة2-التبرع بخلايا الدم الحمراء: يستغرق حوالي 45 دقيقة     التبرع بالصفائح الدموية : التبرع يستغرق حوالي 60-90 دقيقة3- اعتمادا على الطول ووزن المتبرع وعدد الصفائح الدموية كم مرة يمكنني التبرع بالدم؟  1-التبرع بالدم: كل 8 أسابيع تصل إلى 6 مرات في السنة    2-التبرع بخلايا الدم الحمراء : كل 16 أسابيع إلى 3 مرات في السنة     3-التبرع بالصفائح الدموية: كل 2 أسابيع تصل إلى 24 مرات في السنة"
        
            Procee2.text = " من يستطيع أن تبرع بالدم؟  المتبرعين الأصحاء الذين تتراوح أعمارهم بين 17-70 سنة من العمر.  المواطنين أو المقيمين الذين لديهم إقامة سارية المفعول يجب أن يكون وزن المتبرع ≤ 50 كيلو غرام"
 
            Procee3.text = " كيف يمكنني التحضير ليوم التبرع؟استشير الطبيب إذا كان لديك أي مرض مزمن أو كنت خضعت لجراحة قد تؤثر على صحتك أو تؤثر على سلامة الدم.    بالنسبة للسيدات: ألا تكون حاملا أو في فترة الدورة الشهرية ,أن يكون قد مضى 6 أسابيع على الأقل بعد الولادة.   يجب الانتظار 3 أيام على الأقل بعد أي إجراء بالأسنان,قبل التبرع بالدم.    يرجى إبلاغ الطبيب إذا كنت قد تلقيت دم في السابق.  برجاء إحضار بطاقتك المدنية الأصلية على أن تكون سارية في يوم التبرع بالدم."
            before1.text = "ونود أن نعرب عن شكرنا وامتناننا لتعاونكم معنا من خلال تقديم لبنك الدم هدية ذات مغزى لجميع المرضى في المستشفيات الكويتية. لجعل تبرعك  قيماَ يرجى اتباع التعليمات التالية: 1- النوم 6-8 ساعات على الأقل قبل يوم التبرع  2- كن في صحة جيدة وتجنب بعض الأدوية مثل:  الأسبرين، أو المنتجات التي تحتوي على الأسبرين، لمدة 5 أيام على الأقل قبل الموعد المحدد.  الأدوية غير المسكنة - الستيرويدية، وأدوية التهابات مضاد (مثل ايبوبروفين) لمدة 48 ساعة قبل موعدك .   المضادات الحيوية لمدة سبعة أيام على الأقل قبل الموعد المحدد.  إذا كنت تأخذ أي أدوية أخرى، الرجاء إبلاغ الطبيب"
                        before3.text = " التبرع بالصفائح الدموية يساعد على إنقاذ حياة مرضى السرطان، والمرضى الأعضاء أو زرع نخاع العظام ع، ضحايا الإصابات، والمرضى الذين يخضعون لجراحات القلب المفتوح. 70 دقيقة من وقتك مرة واحدة كل شهر يمكن أن ينقذ واحد من هؤلاء المرضىالرجاء المساعدة من خلال كونها المانحة الصفائح الدموية العادية  لا تنس أن تأخذ موعد لتبرعك المقبل شكرا"
            After1.text =  "  شكرا لتبرعك اليوم فبهذا تساعد من هم بحاجة ماسة الى دمك من المرضى وبما أننا نهتم بسلامتكم نرجو منك اتباع التعليمات التالية:   البقاء جالسا على كرسي التبرع لمدة خمس دقائق على الأقل ثم النهوض ببطء ولا تترك غرفة التبرع قبل أن نسمح لك بذلك.     أنت مدعو كي تجلس في منطقة الاستراحة لمدة خمسة عشر دقيقة تكون خلالها تحت الملاحظة الطبية ويجب عليك اخبار الطاقم الطبي في حال شعورك بالتعب     من فضلك تناول العصير المقدم إليك قبل مغادرتك المكان واحرص على تناول كمية كافية من السوائل خلال الأربع ساعات الأولى التالية للتبرع وأيضا خلال الثلاث أيام التالية وذلك لتعويض ما فقده جسمك أثناء التبرع بالدم."
            
            After2.text = "  يجب التركيز على الأطعمة الغنية بالحديد في الأيام التالية للتبرع.    إذا كنت مدخنا لا تدخن لمدة ساعتين بعد التبرع لأن استنشاق الدخان  يحفز الدم للذهاب إلى الرئتين مما يسبب حالة من الدوار والشحوب   احرص على إبقاء الضماد الطبي في مكان التبرع جافا لمدة أربع ساعات مع العلم بأنه ليس من المعتاد حدوث نزيف من مكان ولكن ان حدث ذلك فإنه يجب عليك رفع ذراعك بحيث يكون في مستوى أعلى من الرأس مع الضغط بشكل كاف على موضع النزف حتى يتوقف ثم قم باستبدال الضماد الطبي ولا تزيله الا بعد اربع ساعات."
            After3.text = "  تفادي حمل الأوزان الثقيلة أو ممارسة أي نوع من أنواع الرياضات العنيفة وكذلك الأعمال الشاقة مثل أعمال البناء أو الغوص أو قيادة سيارة النقل الثقيلة لمدة اثنتي عشرة ساعة بعد التبرع."
            After4.text = "   في حالة ظهور كدمات في مكان التبرع يرجى اتباع التالي:   في اليوم الأول: ضع بعض قطع من الثلج في قطعة من القماش نظيفة ثم ابقها على موضع الكدمة لمدة 15 – 20 دقيقة 3 الى 4 مرات في اليوم. من اليوم الثاني وحتى الرابع: ضع قطعة من القماش مبللة بالماء الدافىء على موضع الكدمة لمدة 15 دقيقة 3 الى 4 مرات يوميا ولا تقلق إن لاحظت حدوث تغير في لون الكدمة أو زيادة في مساحتها وسوف تختفي تدريجيا خلال العشرة ايام التالية. "
           After5.text = " إذا شعرت بدوار أو زغللة: اجلس مع وضع رأسك بين الركبتين أو استلقي فورا على سطح مستو مع رفع القدمين أعلى من مستوى الرأس أبقى على هذا الوضع حتى زوال الأعراض.  حرصا على سلامتك وسلامة المرضى الذين سوف ينقل لهم دمك سيقوم بنك الدم بفحص دمك للكشف عن الأمراض التي يمكن أن تنتقل عن طريق الدم.  أحيانا تعجز التحاليل المعملية عن اكتشاف المرض لو كانت الإصابة به مبكرة لذا فإن كان لديك شك بخصوص سلامة المرضى نرجو منك الاتصال ببنك الدم والتحدث مع الطبيب المختصر وابلاغه برقمك المدني واعلم انك لست مضطرا لذكر ايه اسباب وسيتم التعامل مع بياناتك بسرية تامة. "
            After6.text = "   حرصا منا على سلامتك وسلامة المرضى الذين سوف ينقل لهم دمك نرجو منك مراجعة بنك الدم او الاتصال على الرقم المكتوب على النشرة في حالة:  حدوث كدمة أكبر من 5 سم أو احمرار أو تورم  أو ألم في مكان التبرع.   الشعور بألم أو وخز في أصابعك أو ذراعيك.  إذا كان لديك أي شكوى ناتجة عن عملية التبرع.   إذا ارتفعت درجة حرارة جسمك، أو أصيبت بالإعياء خلال اليومين التاليين للتبرع.    إذا تذكرت أي شيء قد يكون له تأثير على سلامة دمك."
            After7.text = "  أمانتك و حرصك هما الضمان الوحيد لجعل نقل الدم عملية آمنة. في كل مرة تتبرع فيها تساعد في إنقاذ حياة شخص آخر بحاجة ماسة إلى دمك. هناك مصدر واحد فقط للدم هو ....... أنت ,ساعدنا وكن متبرع منتظم عناوين بنك الدم المركز الرئيسي: بنك الدم المركزي بالجابرية بنك الدم - فرع مستشفى العدان بنك الدم - فرع مستشفى الجهراء بنك الدم – فرع العاصمة بنك الدم – فرع الحرس الوطني"
            can1.text = " متى استطيع التبرع مرة أخرى؟    التبرع بالدم: كل 8 أسابيع تصل إلى 6 مرات في السنة.     التبرع بخلايا الدم الحمراء : كل 16 أسابيع إلى 3 مرات في السنة.    التبرع بالصفائح الدموية: كل 2 أسابيع تصل إلى 24 مرات في السنة من يستطيع أن تبرع بالدم؟     المتبرعين الأصحاء الذين تتراوح أعمارهم بين 17-70 سنة من العمر.  المواطنين أو المقيمين الذين لديهم إقامة سارية المفعول.  يجب أن يكون وزن المتبرع ≤ 50 كيلو غرام"
            
            can1.text = "   كيف يمكنني التحضير ليوم التبرع؟     النوم 6-8 ساعات على الأقل قبل يوم التبرع.    شرب الكثير من السوائل.   أكل وجبات خفيفة صحية (خالية من الدهون) في يوم التبرع.     أن تكون في صحة جيدة و في حال تناول الأدوية التي قد تتعارض مع التبرع بالدم مثل المضادات الحيوية أو أي من الأدوية الموجودة بقائمة المرفقة برجاء استشارة الطبيب.    استشير الطبيب إذا كان لديك  أي مرض مزمن أو كنت خضعت لجراحة قد تؤثر على صحتك أو تؤثر على سلامة الدم.    بالنسبة للسيدات: ألا تكون حاملا أو في فترة الدورة الشهرية ,أن يكون قد مضى 6 أسابيع على الأقل بعد الولادة.   يجب الانتظار 3 أيام على الأقل بعد أي إجراء بالأسنان,قبل التبرع بالدم.    يرجى إبلاغ الطبيب إذا كنت قد تلقيت دم في السابق    برجاء إحضار بطاقتك المدنية الأصلية على أن تكون سارية في يوم التبرع بالدم"
            
        }
        
    }

}
