!
    function(t) {
        var i = function(i, n) {
            var e = this;
            this.obj = i,
                this.index = 0,
                this.options = n,
                this.rotateFlag = !0,
                this.defaults = {
                    imgArr: [],
                    bgSwitchType: "fade",
                    switchDirection: "top",
                    speed: 500,
                    defaultHeight: 425
                },
                t.extend(this.defaults, this.options),
                this.len = e.defaults.imgArr.length,
                this.defaultDOM(),
                this.rotateBannerLeft.on("click",
                    function(t) {
                        t.preventDefault(),
                        e.rotateFlag && (e.rotateFlag = !1, e.box.removeClass("rotateBanner-switchLeft rotateBanner-switchRight").addClass("rotateBanner-switchLeft"), e.btnSwitch(--e.index))
                    }),
                this.rotateBannerRight.on("click",
                    function(t) {
                        t.preventDefault(),
                        e.rotateFlag && (e.rotateFlag = !1, e.box.removeClass("rotateBanner-switchLeft rotateBanner-switchRight").addClass("rotateBanner-switchRight"), e.btnSwitch(++e.index))
                    }),
                this.icon.children("span").on("click",
                    function(i) {
                        i.preventDefault();
                        var n = t(this).index();
                        if (!t(this).hasClass("active") && e.rotateFlag) {
                            e.index = n;
                            for (var a = 0; a < e.len; a++) {
                                var s = a < Math.ceil(e.len / 2) ? "rotateBanner-switchLeft": "rotateBanner-switchRight";
                                e.box.eq(a).removeClass("rotateBanner-switchLeft rotateBanner-switchRight").addClass(s)
                            }
                            e.btnSwitch(n)
                        }
                    }),
                t(window).resize(function(t) {
                    e.BG.height(),
                        e.box.height();
                    e.banner.css("top", (e.BGHeight - e.boxHeight) / 2)
                })
        };
        i.prototype = {
            defaultDOM: function() {
                for (var i = this,
                         n = t("<div class='rotateBanner-BG'>"), e = t("<div class='rotateBanner-BG-effect'>"), a = t("<div class='rotateBanner-Main'>"), s = t("<div class='rotateBanner-Banner'>"), o = t("<div class='rotateBanner-icon'>"), r = t("<div class='rotateBanner-btn rotateBanner-Left'>"), h = t("<div class='rotateBanner-btn rotateBanner-Right'>"), c = (t("body"), ""), d = "", l = 0; l < this.len; l++) {
                    var f = Math.ceil(this.len / 2),
                        g = 0 === l ? "active": "";
                    c += '<div class="rotateBanner-Box ' + (l < f ? "rotateBanner-switchLeft": "rotateBanner-switchRight") + " " + g + '"><img src="' + this.defaults.imgArr[l] + '"width="100%"></div>',
                        d += '<span class="' + g + '"></span>'
                }
                s.append(c),
                    o.append(d),
                    a.append(s, o, r, h),
                    n.append(a),
                    this.obj.wrapInner("<div class='RotateBannerAll'>"),
                    this.All = this.obj.find(".RotateBannerAll"),
                    this.All.append(e, n),
                    this.BG = this.obj.find(".rotateBanner-BG"),
                    this.bgEffect = this.obj.find(".rotateBanner-BG-effect"),
                    this.banner = this.obj.find(".rotateBanner-Banner"),
                    this.box = this.obj.find(".rotateBanner-Box"),
                    this.icon = this.obj.find(".rotateBanner-icon"),
                    this.rotateBannerLeft = this.obj.find(".rotateBanner-Left"),
                    this.rotateBannerRight = this.obj.find(".rotateBanner-Right"),
                    this.All.css("height", this.defaults.defaultHeight),
                    this.iconNumLayout(2),
                    this.BGHeight = this.BG.height(),
                    this.boxHeight = this.box.height();
                for (var b = 0; b < this.len; b++) {
                    var u = new Image;
                    u.src = this.defaults.imgArr[b],
                        t(u).on("load",
                            function() {
                                i.BGHeight = i.BG.height(),
                                    i.boxHeight = i.box.height(),
                                    i.banner.css("top", (i.BGHeight - i.boxHeight) / 2)
                            })
                }
            },
            btnSwitch: function(t) {
                t < 0 ? t = this.index = this.len - 1 : t > this.len - 1 && (t = this.index = 0),
                    this.box.eq(t).fadeIn().children("img").attr("src", this.defaults.imgArr[t]).fadeIn().parent(".rotateBanner-Box").siblings().children().attr("src", ""),
                    this.box.eq(t).addClass("active").siblings(".rotateBanner-Box").removeClass("active").fadeOut(),
                    this.icon.children("span").eq(t).addClass("active").siblings().removeClass("active"),
                    this.bgSwitch(this.defaults.imgArr[t])
            },
            iconNumLayout: function(t) {
                var i = t;
                this.icon.find("span").css({
                    width: 100 / this.len - i + "%",
                    marginRight: i + "%"
                })
            },
            bgSwitch: function(t) {
                var i = this;
                "fade" === this.defaults.bgSwitchType ? this.bgEffect.hide().css("backgroundImage", "url('" + t + "')").fadeIn("slow",
                    function() {
                        i.rotateFlag = !0
                    }) : "slide" === this.defaults.bgSwitchType ? (this.bgEffect.css({
                    backgroundImage: "url('" + t + "')",
                    backgroundPositionX: this.directionFn(this.defaults.switchDirection).backgroundPositionValX,
                    backgroundPositionY: this.directionFn(this.defaults.switchDirection).backgroundPositionValY
                }), this.bgEffect.animate({
                        backgroundPositionX: 0,
                        backgroundPositionY: 0
                    },
                    this.defaults.speed,
                    function() {
                        i.rotateFlag = !0
                    })) : this.bgEffect.hide().css("backgroundImage", "url('" + t + "')").fadeIn("slow",
                    function() {
                        i.rotateFlag = !0
                    })
            },
            directionFn: function(t) {
                var i = this.bgEffect.width(),
                    n = this.bgEffect.height(),
                    e = {};
                return e.backgroundPositionValX = 0,
                    e.backgroundPositionValY = 0,
                    "top" === t ? (e.backgroundPositionValX = 0, e.backgroundPositionValY = -n) : "bottom" === t ? (e.backgroundPositionValX = 0, e.backgroundPositionValY = n) : "left" === t ? (e.backgroundPositionValX = -i, e.backgroundPositionValY = 0) : "right" === t && (e.backgroundPositionValX = i, e.backgroundPositionValY = 0),
                    e
            }
        },
            t.fn.extend({
                rotateBanner: function(n) {
                    this.each(function() {
                        new i(t(this), n)
                    })
                }
            })
    } (jQuery);