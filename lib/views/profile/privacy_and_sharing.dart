import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrivacyAndSharing extends StatelessWidget {
  const PrivacyAndSharing({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.035,
            right: width * 0.035,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy and sharing'.tr(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: height * 0.004,
              ),
              Text(
                'Manage your data, third-party tools, and sharing settings'
                    .tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              PrivacyShareListTile(
                title: 'Request your personal data'.tr(),
                subtitle: 'We'.tr() +
                    'll create a filer for you to download your peronsal data.'
                        .tr(),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black26,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              PrivacyShareListTile(
                title: 'Delete your account'.tr(),
                subtitle:
                    'This will permanently delete your account and your data, in accordance with applicable law.'
                        .tr(),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black26,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              PrivacyShareListTile(
                title: 'Sharing'.tr(),
                subtitle:
                    'Decide how you profile and activity are shown to others',
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black26,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              PrivacyShareListTile(
                title: 'Services'.tr(),
                subtitle: 'View and manage services that you'
                    've connected to your klomi account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyShareListTile extends StatelessWidget {
  const PrivacyShareListTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: Colors.black,
      ),
    );
  }
}
