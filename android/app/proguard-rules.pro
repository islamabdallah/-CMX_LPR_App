# Preserve annotations
-keepattributes *Annotation*

# Keep specific classes related to Tink or any required library
-dontwarn com.google.errorprone.annotations.**
-keep class com.google.errorprone.annotations.** { *; }
-dontwarn javax.annotation.**
-keep class javax.annotation.** { *; }

# Preserve Tink library
-dontwarn com.google.crypto.tink.**
-keep class com.google.crypto.tink.** { *; }

# General keep rules for Gson, Retrofit, or similar libraries (if used)
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# Preserve Firebase classes (if used)
-dontwarn com.google.firebase.**
-keep class com.google.firebase.** { *; }

# Keep Flutter classes
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# Keep your application's generated code (replace `your.package.name`)
-keep class your.package.name.** { *; }
-dontwarn your.package.name.**
