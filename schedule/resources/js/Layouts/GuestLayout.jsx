import { Link } from '@inertiajs/react';

export default function Guest({ children }) {
    return (
        <div className="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 dark:bg-dots-lighter bg-gray-100 dark:bg-gray-900">
            <div>
                <Link href="/">
                    <h1 className="text-4xl">
                        <span className="text-white">PLAN.</span><span className="text-blue-500">IO</span>
                    </h1>
                </Link>
            </div>

            <div className="w-full sm:max-w-md mt-6 px-6 py-4 bg-white dark:bg-gray-800 shadow-md overflow-hidden sm:rounded-lg">
                {children}
            </div>
        </div>
    );
}
