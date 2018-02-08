import DeviceInfo from 'react-native-device-info';
import { create } from 'apisauce';

const deviceInfo = {
    uniqueID: DeviceInfo.getUniqueID(),
    Manufacturer: DeviceInfo.getManufacturer(),
    brand: DeviceInfo.getBrand(),
    model: DeviceInfo.getModel(),
    deviceID: DeviceInfo.getDeviceId(),
    systemName: DeviceInfo.getSystemName(),
    systemVersion: DeviceInfo.getSystemVersion(),
    buildNumber: DeviceInfo.getBuildNumber(),
    appVersion: DeviceInfo.getVersion(),
    versionName: DeviceInfo.getReadableVersion(),
    deviceName: DeviceInfo.getDeviceName(),
    isEmulator: DeviceInfo.isEmulator(),
    isTablet: DeviceInfo.isTablet()
};

const BASE_URL = 'https://us-central1-app2sales-feedback-system.cloudfunctions.net';

const api = create({
    baseURL: BASE_URL,
    headers: {
        'Content-Type': 'application/json'
    }
});

class Feedback {
    constructor() {
        this.project = '';
        this.projectRef = null;
    }

    setProject(project) {
        this.project = project;
    }

    getChangeLog = () =>
        api.get(`/changeLog?project=${this.project}`)
            .then((response) => {
                if (response.ok) {
                    return response.data;
                }
                return [];
            });

    getSubjects = () =>
        api.get(`/subjects?project=${this.project}`)
            .then((response) => {
                if (response.ok) {
                    return response.data;
                }
                return [];
            });

    getFeedbackEnabled = () =>
        api.get(`/feedbackEnabled?project=${this.project}`)
            .then((response) => {
                if (response.ok) {
                    return response.data;
                }
                return [];
            });

    postFeedback(subject, comment, rating, additionalData = null, print = null) {
        const data = {
            subject,
            comment,
            rating,
            additionalData,
            deviceInfo,
            project: this.project
        };
        return api.post('/feedback', data);
    }
}

export default new Feedback();
